package de.tud.es.cppp;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class TopologyMessage extends JSONObject {
    private String id, ap_mac, sta_mac, uplink_bssid, ap_ip, sta_ip, rssi, mesh_level, no_stas;
    JSONArray stas;

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

    public String getRssi() {
        return rssi;
    }

    public String getMesh_level() {
        return mesh_level;
    }

    public String getNo_stas() {
        return no_stas;
    }

    public JSONArray getStas() {
        return stas;
    }

    public TopologyMessage(JSONObject json) {
        stas = (JSONArray) json.get("stas");
        JSONObject nodeInfo = (JSONObject) json.get("nodeinfo");
        id = (String) nodeInfo.get("id");
        ap_mac = (String) nodeInfo.get("ap_mac");
        sta_mac = (String) nodeInfo.get("sta_mac");
        uplink_bssid = (String) nodeInfo.get("id");
        ap_ip = (String) nodeInfo.get("ap_ip");
        rssi = (String) nodeInfo.get("rssi");
        mesh_level = (String) nodeInfo.get("mesh_level");
        no_stas = (String) nodeInfo.get("no_stas");


    }
}
