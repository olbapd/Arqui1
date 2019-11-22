var mqtt = require('mqtt');
var options = {
    port: 16515,
    host: 'm12.cloudmqtt.com',
    clientId: 'guest',
    username: 'kvacnttu',
    password: 'HErp-sdloW_B',
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
    var a = JSON.stringify(req.body);

        // publish a message to a topic
        client.publish('/hour', a, function() {
            console.log("Message is published");
            res.json({
                status: "ok"
            });
            client.end(); // Close the connection when published
        });
    });
};