/**
 * @file PicamDataSource.h
 * @brief Header file for class PicamDataSource
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

 * @details This header file contains the declaration of the class PicamDataSource
 * with all of its public, protected and private members. It may also include
 * definitions for inline methods which need to be visible to the compiler.
 */

#ifndef PICAMDATASUORCE_H_
#define PICAMDATASUORCE_H_

/*---------------------------------------------------------------------------*/
/*                        Standard header includes                           */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/*                        Project header includes                            */
/*---------------------------------------------------------------------------*/
#include "DataSourceI.h"
#include "ProcessorType.h"
#include "File.h"
#include "MemoryMapInterpolatedInputBroker.h"
#include "MessageI.h"
#include "RegisteredMethodsMessageFilter.h"
#include "EmbeddedServiceMethodBinderI.h"
#include "SingleThreadService.h"
#include "EventSem.h"
#include "camera.h"
#include "graphics.h"

/*---------------------------------------------------------------------------*/
/*                           Class declaration                               */
/*---------------------------------------------------------------------------*/
namespace MARTe {
/**
 * @brief A DataSourceI interface which allows to 
 * The configuration syntax is (names are only given as an example):
 * <pre>
 * +PicamDataSource_0 = {
 *     Class = PicamDataSource
 
 * }
 * </pre>
 */
class PicamDataSource: public DataSourceI, public MessageI, public EmbeddedServiceMethodBinderI {
public:
    CLASS_REGISTER_DECLARATION()

    /**
     * @brief Default constructor.
     * @details Initialises all the optional parameters as described in the class description.
     * Registers the RPC CloseFile callback function.
     */
    PicamDataSource    ();

    /**
     * @brief Destructor.
     * @details Frees the memory buffer and closes the file.
     */
    virtual ~PicamDataSource();

    /**
     * @brief See DataSourceI::AllocateMemory. NOOP.
     * @return true.
     */
    virtual bool AllocateMemory();

    /**
     * @brief See DataSourceI::GetNumberOfMemoryBuffers.
     * @return 1.
     */
    virtual uint32 GetNumberOfMemoryBuffers();

    /**
     * @brief See DataSourceI::GetSignalMemoryBuffer.
     * @pre
     *   SetConfiguredDatabase
     */
    virtual bool GetSignalMemoryBuffer(const uint32 signalIdx,
            const uint32 bufferIdx,
            void *&signalAddress);

    /**
     * @brief See DataSourceI::GetBrokerName.
     * @details Only InputSignals are supported.
     * @return MemoryMapSynchronisedInputBroker if interpolate = false, MemoryMapInterpolatedInputBroker otherwise.
     */
    virtual const char8 *GetBrokerName(StructuredDataI &data,
            const SignalDirection direction);

    /**
     * @brief See DataSourceI::GetInputBrokers.
     * @details If interpolate == yes adds a MemoryMapInterpolatedInputBroker instance to
     *  the inputBrokers, otherwise adds a MemoryMapSynchronisedInputBroker instance to the intputBrokers.
     * @pre
     *   GetNumberOfFunctions() == 1u
     */
    virtual bool GetInputBrokers(ReferenceContainer &inputBrokers,
            const char8* const functionName,
            void * const gamMemPtr);

    /**
     * @brief See DataSourceI::GetOutputBrokers.
     * @return false.
     */
    virtual bool GetOutputBrokers(ReferenceContainer &outputBrokers,
            const char8* const functionName,
            void * const gamMemPtr);

    /**
     * @brief Reads into the buffer data the data from the specified file in the specified format.
     * @return true if the data can be successfully read from the file.
     */
    virtual bool Synchronise();


    /**
     * @brief Callback function for an EmbeddedThread.
     * @details Sleeps (Busy or Default) for the period given by 1/Frequency and post an EventSem which is waiting on
     *  the Synchronise method.
     * @param[in] info not used.
     * @return NoError if the EventSem can be successfully posted.
     */
    virtual ErrorManagement::ErrorType Execute(ExecutionInfo & info);



    /**
     * @brief See DataSourceI::PrepareNextState. NOOP.
     * @return true.
     */
    virtual bool PrepareNextState(const char8 * const currentStateName,
            const char8 * const nextStateName);

    /**
     * @brief Loads and verifies the configuration parameters detailed in the class description.
     * @return true if all the mandatory parameters are correctly specified and if the specified optional parameters have valid values.
     */
    virtual bool Initialise(StructuredDataI & data);

    /**
     * @brief Final verification of all the parameters and opening of the file.
     * @details This method verifies that all the parameters (e.g. number of samples) requested by the GAMs interacting with this DataSource
     *  are valid and consistent with the parameters set during the initialisation phase.
     * In particular the following conditions shall be met:
     * - If relevant, the XAxisSignal shall exist and shall have at most one element.
     * - The number of samples of all the signals is one.
     * - At least one signal is set.
     * @return true if all the parameters are valid and if the file can be successfully opened.
     */
    virtual bool SetConfiguredDatabase(StructuredDataI & data);



private:
  /**
     * Memory holding all the signals that are to be stored, for each cycle, in the output file.
     */
    char8 *dataSourceMemory;

    /**
	* Signal offsets 
    */
     uint32 *offsets;

     uint32  numberOfBinaryBytes;
    /** 
     * True if this a synchronising data source
     */
    bool synchronising;
    /**
     * The requested cycle frequency for an application that synchronises on this board.
     */
   float32 cycleFrequency;


    bool isSynchronizing;
    uint32 *time;
    uint32 *counter;
    uint32 period;
    
    CCamera* camera;
 
    int32 pixelWidth;
    int32 pixelHeight;

    bool drawOnFrameBuffer;
    GfxTexture texture;
    float32 aspect_ratio; 
    float32 screen_aspect_ratio;
    float32 aroversar;


 /**
     * The EmbeddedThread to draw image on frame buffer.
     */
    SingleThreadService executor;
  /**
     * The affinity of the thread 
     */
    ProcessorType cpuMask;

    /**
     * The size of the stack of the thread 
     */
    uint32 stackSize;


    /**
     * The semaphore for the synchronisation between the the Synchronise methodand  EmbeddedThread that waits for next frame.
     */
    EventSem synchSem;

    bool stopEmbedd;
    bool inited;
    float32 frequency;
};
}

/*---------------------------------------------------------------------------*/
/*                        Inline method definitions                          */
/*---------------------------------------------------------------------------*/

#endif /* PicamDataSource_H_ */

