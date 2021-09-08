/**
 * @file PicamDataSource.cpp
 * @brief Source file for class PicamDataSource
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
 * the class PicamDataSource (public, protected, and private). Be aware that some 
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
#include "PicamDataSource.h"
#include "MemoryMapSynchronisedInputBroker.h"
//#include "MemoryMapOutputBroker.h"

#include "TypeConversion.h"

/*---------------------------------------------------------------------------*/
/*                           Static definitions                              */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/*                           Method definitions                              */
/*---------------------------------------------------------------------------*/
namespace MARTe {

PicamDataSource::PicamDataSource() :
        DataSourceI(), MessageI(), executor(*this) {
    dataSourceMemory = NULL_PTR(char8 *);
    offsets = NULL_PTR(uint32 *);
  
    time = NULL_PTR(uint32 *);
    counter = NULL_PTR(uint32 *);


    synchronising=false;
    cycleFrequency=1.F;
    
  
    isSynchronizing = false;

    camera=NULL_PTR( CCamera*);
    pixelWidth=640;
    pixelHeight=480;
    screen_aspect_ratio = 1280.f/720.f;
    drawOnFrameBuffer=false;
    stopEmbedd=false;
    if (!synchSem.Create()) {
        REPORT_ERROR(ErrorManagement::FatalError, "Could not create EventSem.");
    }
   inited=false;

}

/*lint -e{1551} -e{1579} the destructor must guarantee that the memory is freed and the file is flushed and closed.. The brokerAsyncTrigger is freed by the ReferenceT */
PicamDataSource::~PicamDataSource() {
  
    if(drawOnFrameBuffer){
	    stopEmbedd=true;
	    if (!synchSem.Post()) {
		REPORT_ERROR(ErrorManagement::FatalError, "Could not post EventSem.");
	    }
	    if (!executor.Stop()) {
		if (!executor.Stop()) {
		    REPORT_ERROR(ErrorManagement::FatalError, "Could not stop SingleThreadService.");
		}
	    }
    }

    StopCamera();

    if (dataSourceMemory != NULL_PTR(char8 *)) {
        GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(dataSourceMemory));
    }
    if (offsets != NULL_PTR(uint32 *)) {
 	GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(offsets));
    }
    
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

bool PicamDataSource::AllocateMemory() {
    return true;
}

uint32 PicamDataSource::GetNumberOfMemoryBuffers() {
    return 1u;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: The signalAddress is independent of the bufferIdx.*/
bool PicamDataSource::GetSignalMemoryBuffer(const uint32 signalIdx, const uint32 bufferIdx, void*& signalAddress) {
    bool ok = (dataSourceMemory != NULL_PTR(char8 *));
    if (ok) {
        /*lint -e{613} dataSourceMemory cannot be NULL here*/
        char8 *memPtr = &dataSourceMemory[offsets[signalIdx]];
        signalAddress = reinterpret_cast<void *&>(memPtr);
    }
    return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: The brokerName only depends on the direction and on the storeOnTrigger property (which is load before).*/
const char8* PicamDataSource::GetBrokerName(StructuredDataI& data, const SignalDirection direction) {
    const char8* brokerName = "";
    if (direction == InputSignals) {
	float32 frequency = 0.F;
        if (!data.Read("Frequency", frequency)) {
            frequency = -1.F;
        }

        if (frequency > 0.F) {
            cycleFrequency = frequency;
	    period=(uint32) (1.e6/frequency);
            synchronising = true;
        }
        brokerName = "MemoryMapSynchronisedInputBroker";
        
    }else if (direction == OutputSignals){

        brokerName = "";
    } 
    return brokerName;
}

bool PicamDataSource::GetInputBrokers(ReferenceContainer& inputBrokers, const char8* const functionName, void* const gamMemPtr) {
   	bool ok = true;
   
	ReferenceT<MemoryMapSynchronisedInputBroker> broker("MemoryMapSynchronisedInputBroker");
	ok = broker->Init(InputSignals, *this, functionName, gamMemPtr);
	if (ok) {
	    ok = inputBrokers.Insert(broker);
	}
    	return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: OutputBrokers are not supported. Function returns false irrespectively of the parameters.*/
bool PicamDataSource::GetOutputBrokers(ReferenceContainer& outputBrokers, const char8* const functionName, void* const gamMemPtr) {
   	
	bool ok=false;
	return ok;
}

bool PicamDataSource::Synchronise() {
    bool ok = true;

    if(isSynchronizing){

	//Read and copy Frame  	
//	ok=false;
	/*const void* frame_data; int frame_sz;
	if(!inited && drawOnFrameBuffer) {
		InitGraphics();
		texture.Create(pixelWidth,pixelHeight);
		aspect_ratio = float(pixelWidth)/float(pixelHeight);
		aroversar=aspect_ratio/screen_aspect_ratio;
	     	camera = StartCamera(pixelWidth,  pixelHeight,(int)frequency,1,true,false );
		inited=true;
//		REPORT_ERROR(ErrorManagement::Information, "Draw on FrameBuffer !");
	}
	
	do{
	
		ok=camera->BeginReadFrame(0,frame_data,frame_sz);
		if(ok){		

  			MemoryOperationsHelper::Copy(reinterpret_cast<void *>(&dataSourceMemory[offsets[2]]), frame_data,frame_sz);	
		        // REPORT_ERROR(ErrorManagement::Information,"Frame size %d",frame_sz);
			if(drawOnFrameBuffer)			
			        texture.SetPixels(frame_data);
			
		        camera->EndReadFrame(0);
		
			
		}
		 Sleep::Sec(0.0001);
	}while(!ok);

	if(drawOnFrameBuffer && ok){
		BeginFrame();
		DrawTextureRect(&texture,-aroversar,-1.f,aroversar,1.f);
		EndFrame();
         }*/

	synchSem.ResetWait(TTInfiniteWait);
	*counter=*counter+1;
	*time=(*time)+period;
     }
	
    return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: NOOP at StateChange, independently of the function parameters.*/
bool PicamDataSource::PrepareNextState(const char8* const currentStateName, const char8* const nextStateName) {
        bool ok=true;

 	//uint32 nOfSignals = GetNumberOfSignals();
	//uint32 tmp=0u;	
	//REPORT_ERROR(ErrorManagement::Information,"PrepareNextState");
	//uint32 numberOfFunctions = GetNumberOfFunctions();
 	if(isSynchronizing){
  	
		time=(uint32*)(&dataSourceMemory[offsets[0]]);
		*time=0u;
		counter=(uint32*)(&dataSourceMemory[offsets[1]]);
		*counter=0u;

	}
	


	/*if(camera!=NULL_PTR( CCamera*) && !inited){
		//StopCamera();
		camera->StartCapture();
	}*/
	//if(drawOnFrameBuffer)
	if (executor.GetStatus() == EmbeddedThreadI::OffState) {

/*		 stopEmbedd=false;
		
		 ok = executor.Stop();*/
		
    		ok = executor.Start();
	}

        //totalCalls=0;	 
	/*for (uint32 i = numberOfTimeChannels; i < numberOfSignals; i++) {
            uint32 signalNumberOfConsumers = 0u;
            uint32 signalNumberOfProducers = 0u;
            GetSignalNumberOfConsumers(i, nextStateName, signalNumberOfConsumers);
            GetSignalNumberOfProducers(i, nextStateName, signalNumberOfProducers);
	   // if this is a read signal	    
     	    if (signalNumberOfConsumers > 0u) {

	  //      totalCalls+=signalNumberOfConsumers;          
         	if (GetSignalByteSize(i, tmp)) {
			//if(ddbin==NULL)			
			//	GetSignalMemoryBuffer(i,0,ddbin);
			
			totSizeToRead+=tmp;
		}
	    }else if(signalNumberOfProducers>0u){
		
	    //    totalCalls+=signalNumberOfProducers;	
		if (GetSignalByteSize(i, tmp)) {
			//if(ddbout==NULL)			
			//	GetSignalMemoryBuffer(i,0,ddbout);
			
			totSizeToWrite+=tmp;
		   
		}

	   }
	}
	tmp=totSizeToRead;
	if(tmp<totSizeToWrite)
		tmp=totSizeToWrite;

	spiSize=tmp;
        REPORT_ERROR(ErrorManagement::Information, "PicamDataSource::size to read %d size to write %d spi size %d ",totSizeToRead,totSizeToWrite,spiSize);

	if (spiBuffer != NULL_PTR(uint8 *)) {
	        GlobalObjectsDatabase::Instance()->GetStandardHeap()->Free(reinterpret_cast<void *&>(spiBuffer));
    	}

        spiBuffer = reinterpret_cast<char8 *>(GlobalObjectsDatabase::Instance()->GetStandardHeap()->Malloc(spiSize+1));
	//deallocate and allocate SPIBuffer as the max between read and write.
*/

	return ok;
}

/*lint -e{715}  [MISRA C++ Rule 0-1-11], [MISRA C++ Rule 0-1-12]. Justification: the method sleeps for the given period irrespectively of the input info.*/
ErrorManagement::ErrorType PicamDataSource::Execute(ExecutionInfo& info) {

        ErrorManagement::ErrorType err= ErrorManagement::NoError;
	/*InitGraphics();
  	texture.Create(pixelWidth,pixelHeight);
	aspect_ratio = float(pixelWidth)/float(pixelHeight);
	aroversar=aspect_ratio/screen_aspect_ratio;*/
	bool ok = true;
	const void* frame_data; int frame_sz;
 
      	InitGraphics();
	texture.Create(pixelWidth,pixelHeight);
	aspect_ratio = float(pixelWidth)/float(pixelHeight);
	aroversar=aspect_ratio/screen_aspect_ratio;
     	camera = StartCamera(pixelWidth,  pixelHeight,(int)frequency,1,true,true);
	inited=true;
	
	REPORT_ERROR(ErrorManagement::Information, "Draw on FrameBuffer !");

	do{	
		
			do{
	
				ok=camera->BeginReadFrame(0,frame_data,frame_sz);
				if(ok){		
				/*if(do_argb_conversion)
					{
						//if doing argb conversion the frame data will be exactly the right size so just set directly
						textures[texidx].SetPixels(frame_data);
					}
					else
					{
						//if not converting argb the data will be the wrong size and look weird, put copy it in
						//via a temporary buffer just so we can observe something happening!
						memcpy(tmpbuff,frame_data,frame_sz);
						textures[texidx].SetPixels(tmpbuff);
					}*/
		  			MemoryOperationsHelper::Copy(reinterpret_cast<void *>(&dataSourceMemory[offsets[2]]), frame_data,frame_sz);
					synchSem.Post();
	
					// REPORT_ERROR(ErrorManagement::Information,"Frame size %d",frame_sz);
					if(drawOnFrameBuffer)			
						texture.SetPixels(frame_data);
			
					camera->EndReadFrame(0);
		
			
				}
				 Sleep::Sec(0.0001);
			}while(!ok);

			if(drawOnFrameBuffer && ok){
				BeginFrame();
				DrawTextureRect(&texture,-aroversar,-1.f,aroversar,1.f);
				EndFrame();
			 }

		 
	}while(!stopEmbedd);


	StopCamera();
	
	return err;
}
bool PicamDataSource::Initialise(StructuredDataI& data) {
    bool ok = DataSourceI::Initialise(data);

    if (ok) {
      
     	ok = data.Read("PixelWidth", pixelWidth);
     	if(!ok){
		REPORT_ERROR(ErrorManagement::Warning,"PixelWidth not specified using default %d",pixelWidth);

	}
	if(ok){
	     	ok = data.Read("PixelHeight", pixelHeight);
	     	if(!ok){
			REPORT_ERROR(ErrorManagement::Warning,"PixelHeight not specified using default %d",pixelHeight);

		}
        }
	isSynchronizing=true;
	
	if(ok){
		StreamString drawOnFrameBufferStr;
		data.Read("DrawOnFrameBuffer", drawOnFrameBufferStr);
     		if(drawOnFrameBufferStr=="True"|| drawOnFrameBufferStr=="Yes")
			drawOnFrameBuffer=true;
		
	}
	
	if(ok&&drawOnFrameBuffer){
		
		ok=data.Read("ScareenAspectRatio", screen_aspect_ratio);
     		if(!ok){
			ok=true;
			screen_aspect_ratio = 1280.f/720.f;
		}
	}
	if(drawOnFrameBuffer){
		
		/*
		if (ok) {
			uint32 cpuMaskIn;
			if (!data.Read("CPUMask", cpuMaskIn)) {
				cpuMaskIn = 0xFFu;
				REPORT_ERROR(ErrorManagement::Warning, "CPUMask not specified using: %d", cpuMaskIn);
			  }
			cpuMask = cpuMaskIn;
		}
		if (ok) {
		    if (!data.Read("StackSize", stackSize)) {
			stackSize = THREADS_DEFAULT_STACKSIZE;
			REPORT_ERROR(ErrorManagement::Warning, "StackSize not specified using: %d", stackSize);
		    }
		}
		if (ok) {
		    ok = (stackSize > 0u);

		    if (!ok) {
			REPORT_ERROR(ErrorManagement::ParametersError, "StackSize shall be > 0u");
		    }
		}
		if (ok) {
		    executor.SetCPUMask(cpuMask);
		    executor.SetStackSize(stackSize);
		}
		*/
	}
	
      }
      REPORT_ERROR(ErrorManagement::Information,"PixelWdth*pixelHeight=%d",pixelHeight*pixelWidth);
    //ok=false;

     /*if (ok) {
      
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
    */



    return ok;
}

bool PicamDataSource::SetConfiguredDatabase(StructuredDataI& data) {
    bool ok = DataSourceI::SetConfiguredDatabase(data);
    if (ok) {
        ok = data.MoveRelative("Signals");
    }
    //Only one and one GAM allowed to interact with this DataSourceI
    if (ok) {
        ok = (GetNumberOfFunctions() == 1u);
        if (!ok) {
            REPORT_ERROR(ErrorManagement::ParametersError, "Exactly one Function allowed to interact with this DataSourceI");
        }
    }
     uint32 nOfSignals = GetNumberOfSignals();

     if (ok) {
            ok = (nOfSignals ==3);
	    if (!ok) {
            	REPORT_ERROR(ErrorManagement::ParametersError, "Exactly one Function allowed to interact with this DataSourceI");
            }
     }
    if(ok)
      	offsets = new uint32[nOfSignals];
	    
    frequency = -1.0F;
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
	
                
            }
	  if(!found){
		ok=false;
	        REPORT_ERROR(ErrorManagement::FatalError, "Frequency for time signal shall be defined");
	  }
        }
	REPORT_ERROR(ErrorManagement::Information, "FPS %f %d ",frequency,(int)frequency);
    
    }

    if(ok){
//	InitGraphics();
	
    }


    //Check signal properties and compute memory
    numberOfBinaryBytes = 0u;
    if (ok) {
        //Do not allow samples
      /*  uint32 functionNumberOfSignals = 0u;
        
	uint32 timeSignalSize=0u;*/
	uint32 frameSize=pixelWidth*pixelHeight*4;
	uint32 n;
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
			//sizeOfTimeChannels+=nBytes;
			name.Seek(0L);		
		}
		if(ok){
		    offsets[n] = numberOfBinaryBytes;
		    
		    ok = GetSignalByteSize(n, nBytes);

		    if(n==2 && nBytes!=frameSize){
			 REPORT_ERROR(ErrorManagement::FatalError, "Frame Size should be PixelWidth*pixelHeight*4 %d != %d ",pixelWidth*pixelHeight*4,nBytes);
			 ok=false;
		    }
		    if(ok){
			    numberOfBinaryBytes += nBytes;
			    GetSignalName(n,name);            	
			    REPORT_ERROR(ErrorManagement::Information, "Signal %d name %s offset %d totsignal %d",n,name.Buffer(),offsets[n],nOfSignals);
		    } 

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


   
	
	      if(ok)
      		dataSourceMemory = reinterpret_cast<char8 *>(GlobalObjectsDatabase::Instance()->GetStandardHeap()->Malloc(numberOfBinaryBytes));
	}

     
    return ok;
}



CLASS_REGISTER(PicamDataSource, "1.0")

}

