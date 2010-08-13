#
# OMNeT++/OMNEST Makefile for libIeee80211MgmtStack
#
# This file was generated with the command:
#  opp_makemake -f --deep --make-so -O out -I../inetmanet/src/networklayer/arp -I../inetmanet/src/transport/sctp -I../inetmanet/src/world -I../inetmanet/src/transport/contract -I../inetmanet/src/linklayer/mfcore -I../inetmanet/src/linklayer/ethernet -I../inetmanet/src/util -I../inetmanet/src/networklayer/ted -I../inetmanet/src/linklayer/ieee80211/mac -I../inetmanet/src/networklayer/common -I../inetmanet/src/networklayer/ipv6 -I../inetmanet/src/applications/pingapp -I../inetmanet/src/networklayer/ldp -I../inetmanet/src/transport/tcp -I../inetmanet/src/util/headerserializers -I../inetmanet/src/transport/udp -I../inetmanet/src/networklayer/rsvp_te -I../inetmanet/src/networklayer/ipv4 -I../inetmanet/src/networklayer/icmpv6 -I../inetmanet/src/base -I../inetmanet/src/networklayer/contract -I../inetmanet/src/linklayer/ieee80211/mgmt -I../inetmanet/src/networklayer/manetrouting/base -I../inetmanet/src/networklayer/mpls -I../inetmanet/src/linklayer/contract -L../inetmanet/out/$(CONFIGNAME)/src -linet -KINETMANET_PROJ=../inetmanet
#

# Name of target to be created (-o option)
TARGET = libIeee80211MgmtStack$(SHARED_LIB_SUFFIX)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I../inetmanet/src/networklayer/arp \
    -I../inetmanet/src/transport/sctp \
    -I../inetmanet/src/world \
    -I../inetmanet/src/transport/contract \
    -I../inetmanet/src/linklayer/mfcore \
    -I../inetmanet/src/linklayer/ethernet \
    -I../inetmanet/src/util \
    -I../inetmanet/src/networklayer/ted \
    -I../inetmanet/src/linklayer/ieee80211/mac \
    -I../inetmanet/src/networklayer/common \
    -I../inetmanet/src/networklayer/ipv6 \
    -I../inetmanet/src/applications/pingapp \
    -I../inetmanet/src/networklayer/ldp \
    -I../inetmanet/src/transport/tcp \
    -I../inetmanet/src/util/headerserializers \
    -I../inetmanet/src/transport/udp \
    -I../inetmanet/src/networklayer/rsvp_te \
    -I../inetmanet/src/networklayer/ipv4 \
    -I../inetmanet/src/networklayer/icmpv6 \
    -I../inetmanet/src/base \
    -I../inetmanet/src/networklayer/contract \
    -I../inetmanet/src/linklayer/ieee80211/mgmt \
    -I../inetmanet/src/networklayer/manetrouting/base \
    -I../inetmanet/src/networklayer/mpls \
    -I../inetmanet/src/linklayer/contract \
    -I. \
    -Inodes \
    -Isrc

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS = -L../inetmanet/out/$(CONFIGNAME)/src  -linet
LIBS += -Wl,-rpath,`abspath ../inetmanet/out/$(CONFIGNAME)/src`

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = $O/src/Ieee80211MgmtAPExtended.o $O/src/Ieee80211MgmtSTAExtended.o $O/src/Ieee80211MgmtBaseExtended.o $O/src/Ieee80211MgmtWDSExtended.o $O/src/Ieee80211AgentSTAExtended.o

# Message files
MSGFILES =

# Other makefile variables (-K)
INETMANET_PROJ=../inetmanet

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppenvir$D $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $(TARGET)

$(TARGET) : $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(SHLIB_LD) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(LIBS) $(OMNETPP_LIBS) $(LDFLAGS)
	$(SHLIB_POSTPROCESS) $O/$(TARGET)

.PHONY:

.SUFFIXES: .cc

$O/%.o: %.cc
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	-rm -rf $O
	-rm -f Ieee80211MgmtStack Ieee80211MgmtStack.exe libIeee80211MgmtStack.so libIeee80211MgmtStack.a libIeee80211MgmtStack.dll libIeee80211MgmtStack.dylib
	-rm -f ./*_m.cc ./*_m.h
	-rm -f nodes/*_m.cc nodes/*_m.h
	-rm -f src/*_m.cc src/*_m.h

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc nodes/*.cc src/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/src/Ieee80211MgmtSTAExtended.o: src/Ieee80211MgmtSTAExtended.cc \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtFrames_m.h \
	$(INETMANET_PROJ)/src/base/PassiveQueueBase.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtBase.h \
	$(INETMANET_PROJ)/src/linklayer/mfcore/AirFrame_m.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211Primitives_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Radio80211aControlInfo_m.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/linklayer/contract/RadioState.h \
	$(INETMANET_PROJ)/src/base/IPassiveQueue.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	src/Ieee80211MgmtSTAExtended.h \
	$(INETMANET_PROJ)/src/linklayer/contract/PhyControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/world/ChannelControl.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h
$O/src/Ieee80211MgmtBaseExtended.o: src/Ieee80211MgmtBaseExtended.cc \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtFrames_m.h \
	$(INETMANET_PROJ)/src/base/PassiveQueueBase.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	src/Ieee80211MgmtBaseExtended.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/IPassiveQueue.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h
$O/src/Ieee80211AgentSTAExtended.o: src/Ieee80211AgentSTAExtended.cc \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtFrames_m.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211Primitives_m.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	src/Ieee80211AgentSTAExtended.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h
$O/src/Ieee80211MgmtAPExtended.o: src/Ieee80211MgmtAPExtended.cc \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ControlManetRouting_m.h \
	$(INETMANET_PROJ)/src/linklayer/ethernet/EtherFrame_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtFrames_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IP.h \
	$(INETMANET_PROJ)/src/base/QueueBase.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtAPBase.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPRoute.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPFragBuf.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/uint128.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/base/ReassemblyBuffer.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/base/AbstractQueue.h \
	$(INETMANET_PROJ)/src/base/PassiveQueueBase.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtBase.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	src/Ieee80211MgmtAPExtended.h \
	$(INETMANET_PROJ)/src/linklayer/contract/RadioState.h \
	$(INETMANET_PROJ)/src/base/ProtocolMap.h \
	$(INETMANET_PROJ)/src/base/IPassiveQueue.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPAccess.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ethernet/Ethernet.h
$O/src/Ieee80211MgmtWDSExtended.o: src/Ieee80211MgmtWDSExtended.cc \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ControlManetRouting_m.h \
	$(INETMANET_PROJ)/src/linklayer/ethernet/EtherFrame_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtFrames_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IP.h \
	$(INETMANET_PROJ)/src/base/QueueBase.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPRoute.h \
	src/Ieee80211MgmtWDSExtended.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPFragBuf.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/uint128.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/base/ReassemblyBuffer.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/base/AbstractQueue.h \
	$(INETMANET_PROJ)/src/base/PassiveQueueBase.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	src/Ieee80211MgmtBaseExtended.h \
	$(INETMANET_PROJ)/src/linklayer/contract/RadioState.h \
	$(INETMANET_PROJ)/src/base/ProtocolMap.h \
	$(INETMANET_PROJ)/src/base/IPassiveQueue.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPAccess.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ethernet/Ethernet.h

