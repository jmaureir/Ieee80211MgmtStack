
import inet.linklayer.ieee80211.mac.Ieee80211Mac;
import inet.linklayer.radio.Ieee80211Radio;
import inet.linklayer.ieee80211.mgmt.Ieee80211AgentSTA;

module Ieee80211NicExtended
{
    parameters:
        string mgmtType; // name of the management module type
        @display("bgb=297,326");
    gates:
        input uppergateIn; // to upper layers
        output uppergateOut; // from upper layers
        input radioIn; // to receive AirFrames
        input agentIn; // to Agent
        output agentOut; // from Agent

    submodules:

        mgmt: <mgmtType> like Ieee80211MgmtInterface {
            parameters:
                @display("p=96,69;q=wlanDataQueue");
        }
        mac: Ieee80211Mac {
            parameters:
                queueModule = "mgmt";
                @display("p=96,155");
        }
        radio: Ieee80211Radio {
            parameters:
                @display("p=96,240");
        }
    connections:
        radioIn --> radio.radioIn;
        radio.uppergateIn <-- mac.lowergateOut;
        radio.uppergateOut --> mac.lowergateIn;

        mac.uppergateOut --> mgmt.macIn;
        mac.uppergateIn <-- mgmt.macOut;

        mgmt.uppergateOut --> uppergateOut;
        mgmt.uppergateIn <-- uppergateIn;

        mgmt.agentOut --> agentOut;
        agentIn --> mgmt.agentIn;
}
