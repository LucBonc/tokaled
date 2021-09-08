#!/bin/bash
#Arguments -l LOADER -f FILENAME -m MESSAGE | -s STATE [-d cgdb|strace]
#-l LOADER=The Loader to use
#-f FILENAME=MARTe configuration file
#-m MESSAGE=Start message
#-s STATE=RealTimeApplication first state 
#-d cgdb=Run with cgdb
#-d strace=Run with strace

#Run with cgdb or strace?
DEBUG=""
echo "performance">/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance">/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "performance">/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "performance">/sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

export MARTe2_DIR=/home/pi/MARTe2-F4E/MARTe2_armv8/
export MARTe2_Components_DIR=/home/pi/MARTe2-F4E/MARTe2-components
export MARTe2_Tokaleds_DIR=/home/pi/MARTe2-F4E/tokaleds/MARTe2-tokaleds

export TARGET=armv8-linux
export tokaleds_path=$MARTe2_Tokaleds_DIR/../MDSPlus/tokaleds_tree/
#/home/pi/trees
#Consume input arguments
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -l|--loader)
    LOADER="$2"
    shift # past argument
    ;;
    -f|--file)
    FILE="$2"
    shift # past argument
    ;;
    -m|--message)
    MESSAGE="$2"
    shift # past argument
    ;;
    -s|--state)
    STATE="$2"
    shift # past argument
    ;;
    -d|--debug)
    DEBUG="$2"
    shift # past argument
    ;;    
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if [ -z ${MARTe2_DIR+x} ]; then echo "Please set the MARTe2_DIR environment variable"; exit; fi
if [ -z ${MARTe2_Components_DIR+x} ]; then echo "Please set the MARTe2_Components_DIR environment variable"; exit; fi

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_DIR/Build/$TARGET/Examples/Core/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:Core/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_DIR/Build/$TARGET/Core/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/EPICSCA/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/ConstantGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/LinuxTimer/

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Tokaleds_DIR/Build/$TARGET/Components/DataSources/SPIDataSource/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Tokaleds_DIR/Build/$TARGET/Components/DataSources/PicamDataSource/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Tokaleds_DIR/Build/$TARGET/Components/DataSources/MDSReaderNS

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/LoggerDataSource/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/DAN/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/NI6259/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/NI6368/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/SDN/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/UDP/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/MDSWriter/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/RealTimeThreadSynchronisation/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/FileDataSource/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/OPCUADataSource/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/DataSources/EPICSPVA/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/IOGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/PIDGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/CRCGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/BaseLib2GAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/ConversionGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/FilterGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/StatisticsGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/GAMs/WaveformGAM/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/Interfaces/BaseLib2Wrapper/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/Interfaces/SysLogger/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/Interfaces/EPICS/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/Interfaces/OPCUA/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MARTe2_Components_DIR/Build/$TARGET/Components/Interfaces/EPICSPVA/
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/EPICS/base-7.0-dev/lib/linux-x86_64
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/mdsplus/lib

echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

MARTeAPP=$MARTe2_DIR/Build/$TARGET/App/MARTeApp.ex

#Start with cgdb or with strace
if [ "$DEBUG" = "gdb" ]
then
    if [ -z ${STATE+x} ]; then
        gdb --args $MARTeAPP -l $LOADER -f $FILE -m $MESSAGE
    else
        gdb --args $MARTeAPP -l $LOADER -f $FILE -s $STATE
    fi
elif [ "$DEBUG" = "strace" ]
then
    if [ -z ${STATE+x} ]; then
        strace -o/tmp/strace.err $MARTeAPP -l $LOADER -f $FILE -m $MESSAGE
    else
        strace -o/tmp/strace.err $MARTeAPP -l $LOADER -f $FILE -s $STATE
    fi
else
    if [ -z ${STATE+x} ]; then
        $MARTeAPP -l $LOADER -f $FILE -m $MESSAGE
    else
        $MARTeAPP -l $LOADER -f $FILE -s $STATE 
    fi
fi
