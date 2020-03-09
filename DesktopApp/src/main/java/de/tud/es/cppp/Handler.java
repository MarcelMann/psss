package de.tud.es.cppp;

import java.awt.*;
import java.awt.geom.Rectangle2D;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Stream;

import org.abego.treelayout.TreeLayout;
import org.abego.treelayout.util.DefaultConfiguration;
import org.abego.treelayout.util.FixedNodeExtentProvider;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.graphstream.graph.Graph;
import org.graphstream.graph.Node;
import org.graphstream.graph.implementations.SingleGraph;
import org.graphstream.ui.view.Viewer;

import javax.swing.*;

public class Handler {


    private static HashMap<String, NetworkNode> nodesById = new HashMap<String, NetworkNode>();
    private static HashMap<String, NetworkNode> unknownApMacs = new HashMap<String, NetworkNode>();
    private static HashMap<String, NetworkNode> unknownStaMacs = new HashMap<String, NetworkNode>();
    private static Logger logger;

    private static Handler instance;
    private MainFrame mainFrame;
    private NetworkNode networkRoot =null;
    private NodesTableFrame nodesTableFrame;

    private Graph graph = new SingleGraph("Testing");

    NetworkTree tree;
    DefaultConfiguration<NetworkNode> config;
    FixedNodeExtentProvider<NetworkNode> extentProvider;
    TreeLayout<NetworkNode> treeLayout;
    NetworkNodeTreePane pane;
    private Map<NetworkNode, Rectangle2D.Double> nodeBounds;

    public static synchronized Handler getInstance(){


        if (Handler.instance == null){
            Handler.instance = new Handler();
        }
        return Handler.instance;
    }
    private Handler(){
        logger = LogManager.getLogger("Handler");
    };

    // TODO: Check for disconnecting nodes
    private int counter = 0;

    public void handleincomingTopologyMessage(TopologyMessage msg) {
        String nodeId = msg.getId();
        String apMac = msg.getAp_mac();
        String staMac = msg.getSta_mac();
        NetworkNode node;
        logger.info("Handling message from Node ["+nodeId+"]");
        // TODO: implement the case, where a node is known as Sta AND as Ap already

        // Check if Node is already known
        if (nodesById.containsKey(nodeId)) {
            logger.debug("Node is known already");
            node = nodesById.get(nodeId);
            node.handleMessage(msg);
        } else if(unknownStaMacs.containsKey(staMac)){
            logger.debug("Node is known as Station already");
            node = unknownStaMacs.get(staMac);
            node.handleMessage(msg);
            nodesById.put(nodeId, node);
            unknownStaMacs.remove(staMac);
        } else if (unknownApMacs.containsKey(apMac)){
            logger.debug("Node is known as AP already");
            node = unknownApMacs.get(apMac);
            node.handleMessage(msg);
            nodesById.put(nodeId, node);
            unknownApMacs.remove(apMac);
        }else {
            logger.debug("Node is unknown yet");
            node = new NetworkNode(msg);
            nodesById.put(nodeId, node);
        }

        createLinksForNode(node);

        counter++;
        //logger.debug("Print");
        for(NetworkNode nodeIt : nodesById.values()){
            logger.info(nodeIt.printNeighbors());
        }
        nodesTableFrame.update(nodesById);
        if (findRoot() && counter == 3) {
            logger.info("Create visualization");
            tree = new NetworkTree(networkRoot);
            config = new DefaultConfiguration<>(50,50);
            //
            extentProvider = new FixedNodeExtentProvider<>(200,100);
            treeLayout = new TreeLayout<NetworkNode>(tree, extentProvider, config);
            pane = new NetworkNodeTreePane(treeLayout);
            mainFrame.setContent(pane);
            nodeBounds = treeLayout.getNodeBounds();
            logger.info(treeLayout.getNodeBounds().toString());

            // Graphstream
            addNodesToGraph();
            logger.info("Handling Doneeee");
            addEdgesToGraph(networkRoot);
            logger.info("Handling Donee");
            Viewer viewer = graph.display();
            //viewer.disableAutoLayout();
        }


        logger.info("Handling Done");
    }
    private void addNodesToGraph(){
        for (NetworkNode node : nodesById.values()) {
            Node n = graph.addNode(node.getId());
            n.setAttribute("ui.label", node.getId());
            Rectangle2D.Double bounds = nodeBounds.get(node);
            //n.setAttribute("xyz", bounds.x, bounds.y, 0);
        }
        for (NetworkNode node : unknownStaMacs.values()) {
            graph.addNode(node.getId());
        }
        for (NetworkNode node : unknownApMacs.values()) {
            graph.addNode(node.getId());
        }
    }
    private void addEdgesToGraph(NetworkNode node){
        logger.info(node.getId());
        logger.info(node.printNeighbors());
        logger.info(node.toString());
        for (NetworkNode child : node.getStaNodes()) {
            graph.addEdge(node.getId() + "->" + child.getId(), node.getId(), child.getId());
            addEdgesToGraph(child);
        }

    }
    private static void showInDialog(JComponent panel) {
        System.out.println("make dialog");
        JDialog dialog = new JDialog();
        Container contentPane = dialog.getContentPane();
        ((JComponent) contentPane).setBorder(BorderFactory.createEmptyBorder(
                10, 10, 10, 10));
        contentPane.add(panel);
        dialog.pack();
        dialog.setLocationRelativeTo(null);
        dialog.setVisible(true);
    }
    private boolean findRoot(){
        // Router is root
        if(unknownApMacs.size() != 1){
            networkRoot =null;
            logger.info("No root");
            return false;
        }else{
            networkRoot=unknownApMacs.values().iterator().next();
            logger.info("Root found");
            return true;
        }
    }
    private NetworkNode getNodeWhere(String uplinkBSSID, Function<NetworkNode, String> func){
        HashMap<String, NetworkNode> allNodes = new HashMap<>();
        allNodes.putAll(nodesById);
        allNodes.putAll(unknownApMacs);
        allNodes.putAll(unknownStaMacs);

        for (NetworkNode other : allNodes.values()){
            if (func.apply(other).equals(uplinkBSSID)){
                return other;
            }
        }
        return null;
    }
    
    private NetworkNode findUplinkNode(String uplinkBSSID){
        HashMap<String, NetworkNode> allNodes = new HashMap<>();
        allNodes.putAll(nodesById);
        allNodes.putAll(unknownApMacs);
        allNodes.putAll(unknownStaMacs);

        for (NetworkNode other : allNodes.values()){
            if (other.getApMac().equals(uplinkBSSID)){
                return other;
            }
        }
        return null;
    }
    private NetworkNode findStationNode(String mac) {
        for (NetworkNode other : nodesById.values()){
            if (other.getStaMac().equals(mac)){
                return other;
            }
        }
        return null;
    }

    private void createLinksForNode(NetworkNode node){
        logger.info("Create Uplink Link");
        // Handle Uplink
        String uplinkBSSID = node.getUplink_bssid();
        NetworkNode myUplinkNode = findUplinkNode(uplinkBSSID);
        NetworkNode myUplinkNode2 = getNodeWhere(uplinkBSSID, NetworkNode::getApMac);
        logger.info("EQUALS: " + myUplinkNode.equals(myUplinkNode2));
        if (myUplinkNode == null) {
            // Uplink not found, create new Node as Uplink
            myUplinkNode = new NetworkNode();
            myUplinkNode.setApMac(uplinkBSSID);
            unknownApMacs.put(uplinkBSSID, myUplinkNode);
        }
        // Connect both Nodes
        node.setUplinkNode(myUplinkNode);
        myUplinkNode.addStationNode(node);
        logger.info("Create Stations Link");
        // Handle Stations
        TopologyMessage.Station[] stations = node.getStations();
        if(stations != null){
        for (TopologyMessage.Station station : stations) {
            String staMac = station.getMac();
            NetworkNode thisStationNode = findStationNode(staMac);
            if(thisStationNode == null){
                // Sta node not known yet
                thisStationNode = new NetworkNode();
                thisStationNode.setStaMac(staMac);
                unknownStaMacs.put(staMac, thisStationNode);
            }
            node.addStationNode(thisStationNode);
            thisStationNode.setUplinkNode(node);
        }}
        /*

        logger.info("updating Links betweeen nodes");
        for(NetworkNode node: nodesById.values()){
            String uplink_bssid = node.getUplink_bssid();
            TopologyMessage.Station[] stations = node.getStations();
            for (NetworkNode other : nodesById.values()){

                // check if other is my uplink
                logger.debug("Check Uplink: " + uplink_bssid + "=?" + other.getApMac() + " -> " + other.getApMac().equals(uplink_bssid));
                boolean uplinkFound = false;
                if (other.getApMac().equals(uplink_bssid)) {
                    node.setUplinkNode(other);
                    uplinkFound=true;
                }
                if(!uplinkFound && !unknownApMacs.containsKey(uplink_bssid)){
                    NetworkNode uplinkNode = new NetworkNode();
                    uplinkNode.setApMac(uplink_bssid);
                    uplinkNode.addStationNode(node);
                    unknownApMacs.put(uplink_bssid, uplinkNode);
                    node.setUplinkNode(uplinkNode);
                }
                if(node.getNoStas()>0) {
                    // check if other is one of my stations
                    for (TopologyMessage.Station station : stations) {
                        boolean staFound = false;
                        logger.debug("Check Station: " + station.getMac() + "=?" + other.getStaMac() + " -> " + other.getStaMac().equals(station.getMac()));
                        if (node!=other && other.getStaMac().equals(station.getMac())) {
                            node.addStationNode(other);
                            staFound = true;
                        }
                        if (!staFound && !unknownStaMacs.containsKey(station.getMac())){
                            NetworkNode staNode = new NetworkNode();
                            staNode.setStaMac(station.getMac());
                            staNode.setUplinkNode(node);
                            unknownStaMacs.put(station.getMac(), staNode);
                            node.addStationNode(staNode);
                        }
                    }
                }
            }
        }

         */
    }

    public void setFrame(MainFrame mainFrame) {
        this.mainFrame = mainFrame;
    }

    public void setNodesTableFrame(NodesTableFrame nodesTableFrame) {
        this.nodesTableFrame = nodesTableFrame;
    }
}
