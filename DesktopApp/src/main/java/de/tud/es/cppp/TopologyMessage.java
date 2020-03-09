package de.tud.es.cppp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.HashSet;
import java.util.Set;

public class TopologyMessage{
    private String id, ap_mac, sta_mac, uplink_bssid, ap_ip, sta_ip;
    private int rssi, mesh_level, no_stas;
    Station[] stations;

    private static Logger logger = LogManager.getLogger("TopologyMessage");

    public String getId() {
        return id;
    }
    public String getAp_mac() {
        return ap_mac;
    }
    public String getSta_mac() {
        return sta_mac;
    }
    public String getUplink_bssid() {
        return uplink_bssid;
    }
    public String getAp_ip() {
        return ap_ip;
    }
    public String getSta_ip() {
        return sta_ip;
    }
    public int getRssi() {
        return rssi;
    }
    public int getMesh_level() {
        return mesh_level;
    }
    public int getNo_stas() {
        return no_stas;
    }

    public Station[] getStations() {
        return stations;
    }

    class Station {
        private String mac,ip;

        public Station(JSONObject station) {
            this.ip = (String) station.get("ip");
            this.mac = (String) station.get("mac");
        }

        public String getMac() {
            return mac;
        }

        public String getIp() {
            return ip;
        }

        @Override
        public String toString() {
            return "Station{" +
                    "mac='" + mac + '\'' +
                    '}';
        }
    }

    public TopologyMessage(JSONObject json) {
        logger.debug("Instantiate new Message");
        /*
         Message is
          JSONObj
            |- "nodeinfo"   : JSONObj
                                    |- 9*key:value pairs
            |- "stas        :   JSONArray
                                    |- x*JSONObj
                                            |- mac  :   value
                                            |- ip   :   value

        */
        // Handle nodeinfo-JSONObj
        JSONObject nodeInfo = (JSONObject) json.get("nodeinfo");
        id = (String) nodeInfo.get("id");
        ap_mac = (String) nodeInfo.get("ap_mac");
        sta_mac = (String) nodeInfo.get("sta_mac");
        uplink_bssid = (String) nodeInfo.get("uplink_bssid");
        ap_ip = (String) nodeInfo.get("ap_ip");
        sta_ip = (String) nodeInfo.get("sta_ip");
        rssi = Integer.parseInt((String) nodeInfo.get("rssi"));
        no_stas = Integer.parseInt((String) nodeInfo.get("no_stas"));
        mesh_level = Integer.parseInt((String) nodeInfo.get("mesh_level"));

        if (no_stas > 0) {
            JSONArray stas = (JSONArray) json.get("stas");
            stations = new Station[no_stas];
            for (int i = 0; i<no_stas; i++) {
                stations[i]= new Station((JSONObject) stas.get(i));
            }
        }
        //logger.debug("Created new Message");
    }
}
