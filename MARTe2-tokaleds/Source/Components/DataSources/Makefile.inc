#############################################################
#
# Copyright 2015 F4E | European Joint Undertaking for ITER 
#  and the Development of Fusion Energy ('Fusion for Energy')
# 
# Licensed under the EUPL, Version 1.1 or - as soon they 
# will be approved by the European Commission - subsequent  
# versions of the EUPL (the "Licence"); 
# You may not use this work except in compliance with the 
# Licence. 
# You may obtain a copy of the Licence at: 
#  
# http://ec.europa.eu/idabc/eupl
#
# Unless required by applicable law or agreed to in 
# writing, software distributed under the Licence is 
# distributed on an "AS IS" basis, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either 
# express or implied. 
# See the Licence for the specific language governing 
# permissions and limitations under the Licence. 
#
#############################################################

OBJSX= 

SPB    = SPIDataSource.x \
   	PicamDataSource.x

#ifdef CODAC_ROOT
#SPB    += NI1588.x
#SPB    += NI6259.x
#SPB    += NI6368.x
#SPB    += NI9157.x
#SPB    += DAN.x

## Only force EPICSPVA if CCS version is gt v6.1
#CCSGT61 = $(shell if [ `codac-version -v | sed 's/\(.*\)\.\(.*\)/\1\2/g'` -ge 61 ]; then echo 1; else echo 0; fi)
#ifeq "$(CCSGT61)" "1"
#EPICSPVA = "1"
#endif
#endif

ifdef MDSPLUS_DIR
SPB    += MDSReaderNS.x
endif

#ifdef EPICS_BASE
#SPB   += EPICSCA.x
#endif

#ifdef EPICSPVA
#SPB   += EPICSPVA.x
#endif

# Compilation of SDNPublisher DataSource is contingent to availability of SDN core library, etc.
# Current assumption is prior installation of CODAC Core System on the build node
#ifneq "$(or $(CODAC_VERSION),$(SDN_CORE_LIBRARY_DIR))" ""
#SPB   += SDN.x
#endif

PACKAGE=Components
ROOT_DIR=../../..
MAKEDEFAULTDIR=$(MARTe2_DIR)/MakeDefaults

include $(MAKEDEFAULTDIR)/MakeStdLibDefs.$(TARGET)

LIBRARIES_STATIC+=$(BUILD_DIR)/SPIDataSource/SPIDataSource$(LIBEXT)
LIBRARIES_STATIC+=$(BUILD_DIR)/PicamDataSource/PicamDataSource$(LIBEXT)

#ifdef CODAC_ROOT
#LIBRARIES_STATIC+=$(BUILD_DIR)/DAN/DAN$(LIBEXT)
#LIBRARIES_STATIC+=$(BUILD_DIR)/NI1588/NI1588$(LIBEXT)
#LIBRARIES_STATIC+=$(BUILD_DIR)/NI6259/NI6259$(LIBEXT)
#LIBRARIES_STATIC+=$(BUILD_DIR)/NI6368/NI6368$(LIBEXT)
#LIBRARIES_STATIC+=$(BUILD_DIR)/NI9157/NI9157$(LIBEXT)
#endif

ifdef MDSPLUS_DIR
LIBRARIES_STATIC+=$(BUILD_DIR)/MDSReader/MDSReaderNS$(LIBEXT)
endif

#ifdef EPICS_BASE
#LIBRARIES_STATIC+=$(BUILD_DIR)/EPICSCA/EPICSCA$(LIBEXT)
#endif

#ifdef EPICSPVA
#LIBRARIES_STATIC+=$(BUILD_DIR)/EPICSPVA/EPICSPVADataSource$(LIBEXT)
#endif

# Inclusion of SDNPublisher DataSource is contingent to availability of SDN core library, etc.
#ifneq "$(or $(CODAC_VERSION),$(SDN_CORE_LIBRARY_DIR))" ""
#LIBRARIES_STATIC+=$(BUILD_DIR)/SDN/SDN$(LIBEXT)
#endif

all: $(OBJS)  $(SUBPROJ)  \
 #   $(BUILD_DIR)/DataSources$(LIBEXT) \
 #   $(BUILD_DIR)/DataSources$(DLLEXT)
	echo  $(OBJS)

include $(MAKEDEFAULTDIR)/MakeStdLibRules.$(TARGET)

