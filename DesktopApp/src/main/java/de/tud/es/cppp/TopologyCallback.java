package de.tud.es.cppp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class TopologyCallback implements MqttCallback {
    Logger logger;
    JSONParser parser = new JSONParser();
    Handler handler;

    public TopologyCallback(Handler handler) {
        this.handler = handler;
         logger = LogManager.getLogger("TopologyCallback");
    }

    @Override
    public void connectionLost(Throwable throwable) {

    }

    @Override
    public void messageArrived(String s, MqttMessage mqttMessage){
        //logger.debug("Callback called");
        handleTopologyMessage(mqttMessage);

    }

    private void handleTopologyMessage(MqttMessage mqttMessage){
        //logger.debug("Handling TopologyMessage");
        String jsonString = new String(mqttMessage.getPayload());
        //logger.debug("Message: [" + jsonString + "]");
        JSONObject json = null;
        try {
            json = (JSONObject) parser.parse(jsonString);
            //logger.debug("Create TopologyMessage from JSONObject");
            TopologyMessage tm = new TopologyMessage(json);
            handler.handleincomingTopologyMessage(tm);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {

    }
}
