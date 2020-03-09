package de.tud.es.cppp;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class TopologyCallback implements MqttCallback {

    JSONParser parser = new JSONParser();
    @Override
    public void connectionLost(Throwable throwable) {

    }

    @Override
    public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
        handleTopologyMessage(mqttMessage);

    }

    private void handleTopologyMessage(MqttMessage mqttMessage) throws ParseException {
        String jsonString = new String(mqttMessage.getPayload());
        JSONObject json = (TopologyMessage) parser.parse(jsonString);
        TopologyMessage tm = new TopologyMessage(json);
        Handler.handleTopologyInformation(tm);
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {

    }
}
