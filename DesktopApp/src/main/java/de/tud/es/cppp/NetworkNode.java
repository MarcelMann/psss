package de.tud.es.cppp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Objects;


public class NetworkNode {
    private Logger logger = LogManager.getLogger("NetworkNode");
    private String id;

    private NetworkNode uplinkNode;
    private HashSet<NetworkNode> staNodes = new HashSet<NetworkNode>();

    private int meshLevel = 0;
    private TopologyMessage oldMsg;
    private String apIp;
    private String apMac;
    private String uplink_bssid;
    private int noStas;
    private int rssi;
    private String staMac;
    private String staIp;
    private TopologyMessage.Station[] stations;

    public NetworkNode() {}


    public NetworkNode(String id) {
        this.id=id;
    }

    public void setUplinkNode(NetworkNode uplinkNode) {
        this.uplinkNode = uplinkNode;
    }
    public void setStationNodes(HashSet<NetworkNode> stations) {
        this.staNodes = stations;
    }
    public void setApMac(String apMac) {
        this.apMac = apMac;
    }
    public void setStaMac(String staMac) {
        this.staMac = staMac;
    }
    private String checkIfSet(String s){
        return (s==null) ? "unknown" : s;
    }

    public void addStationNode(NetworkNode station){
        if(!staNodes.contains(station))
            this.staNodes.add(station);
    }

    public Logger getLogger() {
        return logger;
    }
    public String getId() {
        return (id==null) ? Integer.toHexString(hashCode()) : id;
    }
    public NetworkNode getUplinkNode() {
        return uplinkNode;
    }
    public HashSet<NetworkNode> getStaNodes() {
        return staNodes;
    }
    public int getMeshLevel() {
        return meshLevel;
    }
    public TopologyMessage getOldMsg() {
        return oldMsg;
    }
    public String getApIp() {
        return apIp;
    }
    public String getApMac() {
        return checkIfSet(apMac);
    }
    public String getUplink_bssid() {
        return checkIfSet(uplink_bssid);
    }
    public int getNoStas() {
        return noStas;
    }
    public int getRssi() {
        return rssi;
    }
    public String getStaMac() {
        return checkIfSet(staMac);
    }
    public String getStaIp() {
        return staIp;
    }
    public TopologyMessage.Station[] getStations() {
        return stations;
    }

    public NetworkNode(TopologyMessage msg){
        getParamsFromMessage(msg);
    }

    public boolean isNewMessage(TopologyMessage newMsg){
        logger.debug("Check if Msg is new");
        if(oldMsg==null) {
            return true;
        }else {
            return !oldMsg.equals(newMsg);
        }
    }
    public void handleMessage(TopologyMessage newMsg){

        if (isNewMessage(newMsg)){
            logger.debug("Message is new");
            getParamsFromMessage(newMsg);
        }else {
            logger.debug("Message is old, ignoring it");
        }
    }
    private void getParamsFromMessage(TopologyMessage msg){
        this.oldMsg=msg;

        this.id = msg.getId();
        this.apMac = msg.getAp_mac();
        this.apIp = msg.getAp_ip();

        this.staMac = msg.getSta_mac();
        this.staIp = msg.getSta_ip();
        this.uplink_bssid = msg.getUplink_bssid();

        this.meshLevel = msg.getMesh_level();
        this.noStas = msg.getNo_stas();
        this.rssi = msg.getRssi();
        this.stations =msg.getStations();
    }

    public String printNeighbors() {
        return "NetworkNode{" +
                "id='" + id + '\'' +
                ", uplinkNode=" + uplinkNode +
                ", staNodes=" + staNodes +
                '}';
    }

    @Override
    public String toString() {
        return "NetworkNode{" +
                "apMac='" + apMac + '\'' +
                ", uplink_bssid='" + uplink_bssid + '\'' +
                ", staMac='" + staMac + '\'' +
                '}';
    }

    public String getNodeInfo() {
        return  staMac + " | " + staIp + '\n' +
                "---\n" +
                id + '\n' +
                "---\n" +
                apIp + " | " + apMac + '\n';
    }
}
