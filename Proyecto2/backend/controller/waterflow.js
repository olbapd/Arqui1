var mqtt = require('mqtt');
var options = {
     port: 16604,
     host: 'tailor.cloudmqtt.com',
     clientId: 'guest',
     username: 'device',
     password: 'admin',
     keepalive: 60,
     reconnectPeriod: 1000,
     protocolId: 'MQIsdp',
     protocolVersion: 3,
     clean: true,
     encoding: 'utf8'
     };
     
exports.stream = function (req, res) {
    var client= mqtt.connect(options);
    client.on('connect', function() { // When connected

        // subscribe to a topic
        client.subscribe('/waterflow', function() {
            // when a message arrives, do something with it
            client.on('message', function(topic, message, packet) {
            console.log("Received '" + message + "' on '" + topic + "'");
            res.json({
                data: message.toString()
            });
            client.end();
            });
        });
    });
};