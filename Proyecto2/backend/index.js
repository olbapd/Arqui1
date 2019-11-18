// Import express
let express = require('express');
// Import Body parser
let bodyParser = require('body-parser'),
                 cors = require('cors');
// Initialize the app
let app = express();
// Add headers
app.use(bodyParser.json({limit: "50mb"}));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit:50000 }));
app.disable('etag'); // Avoid 304 requests
app.use(cors()); // Enable request from any server -> npm install cors
app.options('*', cors()) // include before other routes
// Import routes
let apiRoutes = require("./api-routes")
// Configure bodyparser to handle post requests
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
// Setup server port
var port = process.env.PORT || 3000;
// Send message for default URL
app.get('/', (req, res) => res.send('Hello World with Express'));
// Use Api routes in the App
app.use('/api', apiRoutes)
// Launch app to listen to specified port
app.listen(port, function () {
    console.log("Running RestApi on port " + port);
});