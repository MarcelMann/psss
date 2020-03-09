package de.tud.es.cppp;

import java.util.HashMap;
import org.apache.logging.log4j.LogManager;


public class Handler {
    private static HashMap<String, Node> nodes = new HashMap();
    private logger = Logger.get


    // TODO: Check for disconnecting nodes

    public static void handleTopologyInformation(TopologyMessage msg) {

        // Check if Node is already known
        if (nodes.containsKey(msg.getId())) {
            // if node is known, lat node handle the new Msg
            nodes.get(msg.getId()).handleMessage(msg);
        } else {
            // if node is unknown, create new Node.
            nodes.put(msg.getId(), new Node(msg));
        }



    }
}
