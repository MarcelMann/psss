package de.tud.es.cppp;

import java.util.HashSet;

public class Node {
    private String id;
    private Node ap;
    private HashSet<Node> stations;
    private int meshLevel;
    private TopologyMessage oldMsg;

    public Node(TopologyMessage msg) {
        this.oldMsg=msg;
        handleNewMsg(msg);
    }

    public boolean isNewMessage(TopologyMessage newMsg){
        return !oldMsg.equals(newMsg);
    }
    public void handleMessage(TopologyMessage newMsg){
        if (isNewMessage(newMsg)){
            handleNewMsg(newMsg);
        }
    }
    private void handleNewMsg(TopologyMessage msg){
        this.id = msg.getId();
    }

}
