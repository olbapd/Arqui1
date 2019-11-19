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
     
exports.new = function (req, res) {
    var client= mqtt.connect(options);
    client.on('connect', function() { // When connected

        // publish a message to a topic
        client.publish('/hour', req.body.value, function() {
            console.log("Message is published");
            res.json({
                status: "ok",
                value:  "'"+req.body.value+"'"
            });
            client.end(); // Close the connection when published
        });
    });
};