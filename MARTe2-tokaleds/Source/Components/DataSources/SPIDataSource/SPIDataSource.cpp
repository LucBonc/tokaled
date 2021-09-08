/**
 * @file SPIDataSource.cpp
 * @brief Source file for class SPIDataSource
 * @date 17/03/2020
 * @author Luca Boncagni
 *
 * @copyright Copyright 2015 F4E | European Joint Undertaking for ITER and
 * the Development of Fusion Energy ('Fusion for Energy').
 * Licensed under the EUPL, Version 1.1 or - as soon they will be approved
 * by the European Commission - subsequent versions of the EUPL (the "Licence")
 * You may not use this work except in compliance with the Licence.
 * You may obtain a copy of the Licence at: http://ec.europa.eu/idabc/eupl
 *
 * @warning Unless required by applicable law or agreed to in writing, 
 * software distributed under the Licence is distributed on an "AS IS"
 * basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the Licence permissions and limitations under the Licence.

 * @details This source file contains the definition of all the methods for
 * the class SPIDataSource (public, protected, and private). Be aware that some 
 * methods, such as those inline could be defined on the header file, instead.
 */

/*---------------------------------------------------------------------------*/
/*                         Standard header includes                          */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/*                         Project header includes                           */
/*---------------------------------------------------------------------------*/
#include "AdvancedErrorManagement.h"
//#include "CLASSMETHODREGISTER.h"
#include "Directory.h"
#include "SPIDataSource.h"
#include "MemoryMapSynchronisedInputBroker.h"
#include "MemoryMapOutputBroker.h"

#include "TypeConversion.h"
#include "spiSupport.h"
/*---------------------------------------------------------------------------*/
/*                           Static definitions                              */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/*                           Method definitions                              */
/*---------------------------------------------------------------------------*/
namespace MARTe {

SPIDataSource::SPIDataSource() :
        DataSourceI(), MessageI() {
    dataSourceMemory = NULL_PTR(char8 *);
    offsets = NULL_PTR(uint32 *);
    spiBuffer = NULL_PTR(uint8 *);
    time = NULL_PTR(uint32 *);
    counter = NULL_PTR(uint32 *);

/*     sizes = NULL_PTR(uint32 *);

   inputOffsets = NULL_PTR(uint32 *);
    inputSizes = NULL_PTR(uint32 *);
    outputOffsets = NULL_PTR(uint32 *);
    outputSizes = NULL_PTR(uint32 *);
*/
    totSizeToWrite=0u;
    totSizeToRead=0u;

    synchronising=false;
    cycleFrequency=1.F;
    
    spiFd=-1;
    device=mode=0;
    speed=16000000;
 
    isSynchronizing = false;
    numberOfTimeChannels = 0u;
    
    clockFd=-1;
    clockPin=-1;
    spiSize=0u;
    period=0u;
    counterLimit= (MAX_UINT32-2)/250;
    //clockPfd;

    //char rdbuf[5];
}

/*lint -e{1551} -e{1579} the destructor must guarantee that the memory is freed and the file is flushed and closed.. The brokerAsyncTrigger is freed by the ReferenceT */
SPIDataSource::~SPIDataSource() {
    if (dataSourceMemory != NULL_PTR(char8 *)) {
        GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(dataSourceMemory));
    }
    if (offsets != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(offsets));
    }
    if (isSynchronizing) {
        gpio_fd_close(clockFd);
        gpio_unexport(clockPin);
    }
    if (spiBuffer != NULL_PTR(uint8 *)) {
        GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(spiBuffer));
    }
    if(spiFd>0)
       close(spiFd);
 /*
    if (sizes != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(sizes));
    }
   if (inputOffsets != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(inputOffsets));
    }

    if (inputSizes != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(inputSizes));
    }
    if (outputOffsets != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(outputOffsets));
    }

    if (outputSizes != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(outputSizes));
    }
    */
}

bool SPIDataSource::AllocateMemory() {
    return true;
}

uint32 SPIDataSource::GetNumberOfMemoryBuffers() {
    return 1u;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: The signalAddress is independent of the bufferIdx.*/
bool SPIDataSource::GetSignalMemoryBuffer(const uint32 signalIdx, const uint32 bufferIdx, void*& signalAddress) {
    bool ok = (dataSourceMemory != NULL_PTR(char8 *));
    if (ok) {
        /*lint -e{613} dataSourceMemory cannot be NULL here*/
        char8 *memPtr = &dataSourceMemory[offsets[signalIdx]];
        signalAddress = reinterpret_cast<void *&>(memPtr);
    }
    return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: The brokerName only depends on the direction and on the storeOnTrigger property (which is load before).*/
const char8* SPIDataSource::GetBrokerName(StructuredDataI& data, const SignalDirection direction) {
    const char8* brokerName = "";
    if (direction == InputSignals) {
	float32 frequency = 0.F;
        if (!data.Read("Frequency", frequency)) {
            frequency = -1.F;
        }

        if (frequency > 0.F) {
            cycleFrequency = frequency;
	    period=(uint32) (1.e6/frequency);
    	    counterLimit=(MAX_UINT32-2)/period;
            synchronising = true;
        }
        brokerName = "MemoryMapSynchronisedInputBroker";
        
    }else if (direction == OutputSignals){

        brokerName = "MemoryMapOutputBroker";
    } 
    return brokerName;
}

bool SPIDataSource::GetInputBrokers(ReferenceContainer& inputBrokers, const char8* const functionName, void* const gamMemPtr) {
   	bool ok = true;
   
	ReferenceT<MemoryMapSynchronisedInputBroker> broker("MemoryMapSynchronisedInputBroker");
	ok = broker->Init(InputSignals, *this, functionName, gamMemPtr);
	if (ok) {
	    ok = inputBrokers.Insert(broker);
	}
    	return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: OutputBrokers are not supported. Function returns false irrespectively of the parameters.*/
bool SPIDataSource::GetOutputBrokers(ReferenceContainer& outputBrokers, const char8* const functionName, void* const gamMemPtr) {
   	
	bool ok=true;
	ReferenceT<MemoryMapOutputBroker> broker("MemoryMapOutputBroker");
	ok = broker->Init(OutputSignals, *this, functionName, gamMemPtr);
	if (ok) {
	    ok = outputBrokers.Insert(broker);
	}
    	return ok;
}

bool SPIDataSource::Synchronise() {
    bool ok = true;
    if(isSynchronizing){
  	//struct timespec t;
	int timeout;
	int ret=0;
	
	//gpio_export(clockPin);
	//gpio_set_dir(clockPin, 0);
	//gpio_set_edge(clockPin, (char*) "rising");

 
/*	if (clockFd < 0) {
		REPORT_ERROR(ErrorManagement::Warning, " clockFd for GPIO%d not opened",clockPin);	
		ok=false;
	}
*/
	clockPfd.fd = clockFd;
	clockPfd.events = POLLPRI;

	lseek(clockFd, 0, SEEK_SET);

	read(clockFd, rdbuf, RDBUF_LEN - 1);

  
	/*if(lastPacketAtime!=0){

	 	clock_gettime(CLOCK_REALTIME,&t );
        	lastPacketAtime=(int64_t) ((t.tv_sec)*1.e6+ t.tv_nsec*1.e-3)-lastPacketAtime;
		timeout=lastPacketAtime*1e-3;

	}else {
		timeout=producerUsecPeriod*1e-3;
		
	  }*/
	/*if(lastPacketUsecTime!=0)
		ret = poll(&clockPfd, 1,timeoutDelta);
	else*/ 
	ret = poll(&clockPfd, 1,-1);

	if (ret < 0) {
		REPORT_ERROR(ErrorManagement::Warning,"poll() error");
		ok=false;    
	}else	if (ret == 0) {
		timeout++;
		REPORT_ERROR(ErrorManagement::Warning,"poll() timeout");


		ok=false;
	}

  	if(ok){
	     ret=-1;
	     if (clockPfd.revents & POLLPRI) {

		    lseek(clockFd, 0, SEEK_SET);
		    ret = read(clockFd, rdbuf, RDBUF_LEN - 1);

		//    printf("%d\n",ret);

		} //else goto POLLING;

		if (ret < 0) {
			gpio_fd_close(clockPin);
			clockFd = gpio_fd_open(clockPin,O_RDONLY | O_NONBLOCK);

			//printf(" cannot read() clock\n");
			//return -1;        
			ok=false;
		}

	}
	

	//couter++
	//time=time+period
     }

    
     if(*counter>=counterLimit){

	*counter=0u;
	 REPORT_ERROR(ErrorManagement::Information,"Uint32 Counter OverFlow %d reset to 0 %d",counterLimit,*counter);
     }

	*counter=*counter+1u;
	*time=((*counter))*period;
    //copy from datasourceMem+sizeRead 
    MemoryOperationsHelper::Copy( static_cast<void *>(spiBuffer),reinterpret_cast<void *>(&dataSourceMemory[offsets[numberOfTimeChannels]]+totSizeToRead), totSizeToWrite);	
    int ret=SpiDataRW3(device,(unsigned char*)spiBuffer,spiSize);
    //REPORT_ERROR(ErrorManagement::Warning,"send %d",ret);
    //copy to datasourceMem+TimeSize
    MemoryOperationsHelper::Copy(reinterpret_cast<void *>(&dataSourceMemory[offsets[numberOfTimeChannels]]), static_cast<void *>(spiBuffer+1), totSizeToRead);	
    //uint32 samp=*((uint16_t*) (&spiBuffer[12]));
    //REPORT_ERROR(ErrorManagement::Information,"sampl %d",samp);
    return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: NOOP at StateChange, independently of the function parameters.*/
bool SPIDataSource::PrepareNextState(const char8* const currentStateName, const char8* const nextStateName) {
    

 	//uint32 nOfSignals = GetNumberOfSignals();
	uint32 tmp=0u;	
	totSizeToRead=0;
	totSizeToWrite=0;
	REPORT_ERROR(ErrorManagement::Information,"PrepareNextState");
	//uint32 numberOfFunctions = GetNumberOfFunctions();
 	if(isSynchronizing){
  	
		time=(uint32*)(&dataSourceMemory[offsets[0]]);
		*time=0u;
		counter=(uint32*)(&dataSourceMemory[offsets[1]]);
		*counter=0u;
	}
	//totalCalls=0;	 
	for (uint32 i = numberOfTimeChannels; i < numberOfSignals; i++) {
            uint32 signalNumberOfConsumers = 0u;
            uint32 signalNumberOfProducers = 0u;
            GetSignalNumberOfConsumers(i, nextStateName, signalNumberOfConsumers);
            GetSignalNumberOfProducers(i, nextStateName, signalNumberOfProducers);
	   // if this is a read signal
	    uint32 nSamples=1;	    
     	    if (signalNumberOfConsumers > 0u) {

	  //      totalCalls+=signalNumberOfConsumers;          
         	if (GetSignalByteSize(i, tmp)) {
			//if(ddbin==NULL)			
			//	GetSignalMemoryBuffer(i,0,ddbin);
		
  	    	        GetFunctionSignalSamples(InputSignals, 0u, i, nSamples);
			
			totSizeToRead+=tmp*nSamples;
		}
	    }else if(signalNumberOfProducers>0u){
		
	    //    totalCalls+=signalNumberOfProducers;	
		if (GetSignalByteSize(i, tmp)) {
			//if(ddbout==NULL)			
			//	GetSignalMemoryBuffer(i,0,ddbout);
			GetFunctionSignalSamples(OutputSignals, 0u, i, nSamples);
			totSizeToWrite+=tmp*nSamples;
		   
		}

	   }
	}
	tmp=totSizeToRead;
	if(tmp<totSizeToWrite)
		tmp=totSizeToWrite;

	spiSize=tmp;
        REPORT_ERROR(ErrorManagement::Information, "SPIDataSource::size to read %d size to write %d spi size %d ",totSizeToRead,totSizeToWrite,spiSize);

	if (spiBuffer != NULL_PTR(uint8 *)) {
	        GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(spiBuffer));
    	}

        spiBuffer = reinterpret_cast<char8 *>(GlobalObjectsDatabase::Instance()->GetStandardHeap()->Malloc(spiSize+1));
	//deallocate and allocate SPIBuffer as the max between read and write.

	return true;
}

bool SPIDataSource::Initialise(StructuredDataI& data) {
    bool ok = DataSourceI::Initialise(data);

   // REPORT_ERROR(ErrorManagement::Warning,"Cpu Freq %d",HighResolutionTimer::Frequency());
    //ok=false;

     if (ok) {
      
     	ok = data.Read("Device", device);
     	if(!ok){
		device=0;
		REPORT_ERROR(ErrorManagement::Warning, "Using default Spi 0 device ");
		ok=true;
     	}
	ok = data.Read("Speed", speed);
	if(!ok){
		speed=150000;
		REPORT_ERROR(ErrorManagement::Warning, "Using default speed 150Khz for spi device");
		ok=true;
     	}
	int mode=0;
	ok = data.Read("Mode", mode);
	if(!ok){
		mode=0;
		REPORT_ERROR(ErrorManagement::Warning, "Uding default mode=0 spi device");
		REPORT_ERROR(ErrorManagement::Warning,"Modes are:\nSPI_LOOP %d\nSPI_CPHA %d\nSPI_CPOL %d\nSPI_LBS_F %d\nSPI_CS_HIGH %d\nSPI_3W %d\nSPI_NO_CS %d\nSPI_READY %d\n",
			SPI_LOOP,
			SPI_CPHA,
			SPI_CPOL,
			SPI_LSB_FIRST,
			SPI_CS_HIGH,
			SPI_3WIRE,
			SPI_NO_CS,
			SPI_READY);
		ok=true;
     	}
	
   	spiFd = SpiSetup(device,speed,mode);
	ok=(spiFd>=1);
        if(!ok){

	  REPORT_ERROR(ErrorManagement::ParametersError, " cannot Open Spi device");
	}


    }
    if(ok){
	ok= data.Read( "ClockPin",clockPin);
   	if (!ok) {
	       REPORT_ERROR(ErrorManagement::Warning, " ClockPin was not specified. no sync IOGAM");
	       isSynchronizing = false;
	       numberOfTimeChannels = 0u;
	       ok=true;
    } else {
        isSynchronizing = true;
	numberOfTimeChannels = 2u;
	ok=(gpio_export(clockPin) == 0);
        if (ok) {
	   	
            StreamString edge;
	    ok=data.Read("ClockEdge",edge);
	    if(ok){
		ok=(edge=="rising");
		if(!ok) 
		    ok=(edge=="falling");
	    }else{
		edge="rising";
		ok=true;
	    }	

	    if(ok){
		    gpio_set_dir(clockPin, 0);
		    gpio_set_edge(clockPin, (char*) edge.Buffer());
		    clockFd = gpio_fd_open(clockPin,O_RDONLY | O_NONBLOCK);
		    ok=(clockFd > 0);
		    if (!ok) {
		        REPORT_ERROR(ErrorManagement::FatalError,"  cannot open clockPin %d %d", clockPin,clockFd);

		    }else{
			   REPORT_ERROR(ErrorManagement::Information,"  clockPin %d %d %s edge sucess", clockPin,clockFd,edge.Buffer());

		   }
	   }
        } else {

             REPORT_ERROR(ErrorManagement::FatalError,"  cannot exportclockPin %d", clockPin);


        }

     }
     

  }


/*Reset Device if need*/
   int32 resetPin=17;
   data.Read( "ResetPin",resetPin);

   if (gpio_export(resetPin) == 0) {
               // outputFds[i] = gpio_fd_open(outputPins[i]);

		gpio_set_dir(resetPin, 1);
		gpio_set_value(resetPin, 0);
		Sleep::NoMore(0.001);

		gpio_set_value(resetPin, 1);


      }
     
    REPORT_ERROR(ErrorManagement::Information,"Reseting device using PIN %d\n",resetPin);

    Sleep::NoMore(0.2);


   /*Read and upload cfg if Found*/
 
    StreamString confFile;

    ok=data.Read("StmCfgFile",confFile);

    if(ok){
	    BasicFile stmCfgFile;

	    ok= stmCfgFile.Open(confFile.Buffer(),BasicFile::ACCESS_MODE_R);

	    if(ok){
	 	stmCfgFile.Seek(0LLU);
		REPORT_ERROR(ErrorManagement::Information,"Cfg File Found %d !",stmCfgFile.Size());
		uint32 realSize=0;
		int32 packetSize = 128;
		data.Read("UploadPacketSize",packetSize);
		char   buffer[packetSize+1];
		buffer[packetSize]='\0';
		StreamString stmCfg="";


		MemoryOperationsHelper::Set(reinterpret_cast<void *>(buffer),0, packetSize);	
		char * initseq="1234";
		MemoryOperationsHelper::Copy(reinterpret_cast<void *>(buffer), static_cast<void *>(initseq), 4);	
		
		SpiDataRW3(device,(unsigned char*)buffer,packetSize);
		
		uint32 size = packetSize;
		while(true){
			MemoryOperationsHelper::Set(reinterpret_cast<void *>(buffer),0, packetSize);			
			stmCfgFile.Read(buffer, size);
			//REPORT_ERROR(ErrorManagement::Information,"%s",buffer);
			if(size>0){	
				stmCfgFile.Write(buffer, size);
				SpiDataRW3(device,(unsigned char*)buffer,packetSize);								
				realSize+=size;
				size = packetSize;
			}else break;

			Sleep::NoMore(0.01);
		}
		stmCfg.Seek(0);
		REPORT_ERROR(ErrorManagement::Information,"Real File Size %d  \n",realSize);
			
		//	ok=false;


		char * stopseq="4321";
		MemoryOperationsHelper::Set(reinterpret_cast<void *>(buffer),0, packetSize);	
		MemoryOperationsHelper::Copy(reinterpret_cast<void *>(buffer), static_cast<void *>(stopseq), 4);	
		
		SpiDataRW3(device,(unsigned char*)buffer,packetSize);
		Sleep::NoMore(0.1);

	     }
   }
	    ok=true;	
   



     
    /*if (ok) {
        ok = data.Read("FileFormat", fileFormatStr);
        if (!ok) {
            REPORT_ERROR(ErrorManagement::ParametersError, "FileFormat shall be specified");
        }
    }
    if (ok) {
        if (fileFormatStr == "csv") {
            fileFormat = FILE_FORMAT_CSV;
        }
        else if (fileFormatStr == "binary") {
            fileFormat = FILE_FORMAT_BINARY;
        }
        else {
            ok = false;
            REPORT_ERROR(ErrorManagement::ParametersError, "Invalid FileFormat specified");
        }
    }
    if (ok) {
        if (fileFormat == FILE_FORMAT_CSV) {
            ok = data.Read("CSVSeparator", csvSeparator);
            if (!ok) {
                REPORT_ERROR(ErrorManagement::ParametersError, "FileFormat=csv and CSVSeparator was not specified");
            }
        }
    }
    if (ok) {
        ok = data.Read("Filename", filename);
        if (!ok) {
            REPORT_ERROR(ErrorManagement::ParametersError, "The Filename shall be specified.");
        }
    }
    if (ok) {
        StreamString interpolateStr;
        ok = data.Read("Interpolate", interpolateStr);
        if (ok) {
            if (interpolateStr == "yes") {
                interpolate = true;
            }
            else if (interpolateStr == "no") {
                interpolate = false;
            }
            else {
                ok = false;
            }
        }
        if (!ok) {
            REPORT_ERROR(ErrorManagement::ParametersError, "Interpolate shall be specified as either yes or no");
        }
    }
    

    if (ok) {
        ok = signalsDatabase.MoveRelative("Signals");
        if (!ok) {
            ok = signalsDatabase.CreateRelative("Signals");
        }
        if (ok) {
            ok = (OpenFile(signalsDatabase) == ErrorManagement::NoError);
        }
        if (ok) {
            ok = signalsDatabase.Write("Locked", 1u);
        }
        if (ok) {
            ok = signalsDatabase.MoveToAncestor(1u);
        }
    }*/



    return ok;
}

bool SPIDataSource::SetConfiguredDatabase(StructuredDataI& data) {
    bool ok = DataSourceI::SetConfiguredDatabase(data);
    if (ok) {
        ok = data.MoveRelative("Signals");
    }
    //Only one and one GAM allowed to interact with this DataSourceI
    /*if (ok) {
        ok = (GetNumberOfFunctions() == 1u);
        if (!ok) {
            REPORT_ERROR(ErrorManagement::ParametersError, "Exactly one Function allowed to interact with this DataSourceI");
        }
    }*/
     uint32 nOfSignals = GetNumberOfSignals();
     if (ok) {
            ok = (nOfSignals > 0u);
            offsets = new uint32[nOfSignals];
     }


    //Check signal properties and compute memory
    numberOfBinaryBytes = 0u;
    if (ok) {
        //Do not allow samples
        uint32 functionNumberOfSignals = 0u;
        uint32 n;
	uint32 timeSignalSize=0u;
	uint32 tmp=0u;

       // if (GetFunctionNumberOfSignals(InputSignals, 0u, functionNumberOfSignals)) {
            for (n = 0u; (n < nOfSignals) && (ok); n++) {
		StreamString name;	
	 	name.Seek(0LLU);   	
		uint32 nBytes = 0u;        
		if(n<=1 && isSynchronizing){

			GetSignalName(n,name); 
				   	
			if(n==0){
				ok=(name =="Time");
			
			}
   	
			if(n==1){
				ok=(name =="Counter");
			
			}
			if(!ok){
				 REPORT_ERROR(ErrorManagement::FatalError, "first 2 signal should be Time and Counter");
			}
		
			GetSignalByteSize(n, nBytes);
			sizeOfTimeChannels+=nBytes;
			name.Seek(0L);		
		}
		if(ok){
		    offsets[n] = numberOfBinaryBytes;
		    
		    ok = GetSignalByteSize(n, nBytes);
		    uint32 nSamples=1;
		    GetFunctionSignalSamples(InputSignals, 0u, n, nSamples);

		
		    numberOfBinaryBytes += nBytes*nSamples;
		    GetSignalName(n,name);            	
		    REPORT_ERROR(ErrorManagement::Information, "Signal %d name %s offset %d totsignal %d samples %d",n,name.Buffer(),offsets[n],nOfSignals,nSamples);

		}
		/*if(ok){
		        uint32 nSamples;
		        ok = GetFunctionSignalSamples(InputSignals, 0u, n, nSamples);
		        if (ok) {
		            ok = (nSamples == 1u);
		        }
		        if (!ok) {
		            REPORT_ERROR(ErrorManagement::ParametersError, "The number of samples shall be exactly 1");
		        }
		}*/
            }
        //}


   
	

	      dataSourceMemory = reinterpret_cast<char8 *>(GlobalObjectsDatabase::Instance()->GetStandardHeap()->Malloc(numberOfBinaryBytes));
	}
/*
    float32 frequency = -1.0F;
    if (ok) {
        uint32 nOfFunctionSignals = 0u;
        ok = GetFunctionNumberOfSignals(InputSignals, 0u, nOfFunctionSignals);

        if (ok) {
            uint32 i;
            bool found = false;
            for (i = 0u; (i < nOfFunctionSignals) && (ok) && (!found); i++) {
                ok = GetFunctionSignalReadFrequency(InputSignals, 0u, i, frequency);
                if (ok) {
                    found = ((frequency > 0.F) && (frequency <= 1e9));
                }
                if (found) {
                    interpolationPeriod = static_cast<uint64>(1e9 / frequency);
                    xAxisSignalName = "";
                    ok = GetFunctionSignalAlias(InputSignals, 0u, i, xAxisSignalName);
                }
            }
        }

    }
    
*/    
    return ok;
}



CLASS_REGISTER(SPIDataSource, "1.0")

}

