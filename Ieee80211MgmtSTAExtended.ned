package Ieee80211MgmtStack;
//
// Station (managed mode) 802.11 managmenet implementation
//
// @author Juan-Carlos Maureira
//

simple Ieee80211MgmtSTAExtended like Ieee80211MgmtInterface
{
    parameters:
        int frameCapacity = default(100); // maximum queue length
        double max_beacons_missed = default(5); // maximum number of beacon missed to notify agent about beacon lost event
        double keep_alive @unit("s") = default(10s); // maximum time to send a keep alive to the associated AP
        @display("i=block/cogwheel");
    gates:
        input uppergateIn;
        output uppergateOut;
        input macIn;
        output macOut;
        input agentIn;
        output agentOut;
}
