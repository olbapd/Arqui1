// api-routes.js
// Initialize express router
let router = require('express').Router();
// Set default API response
router.get('/', function (req, res) {
    res.json({
        status: 'API Its Working',
        message: 'Welcome to RESTApi crafted with love!',
    });
});

var humedad = require('./controller/humedad');
var waterflow = require('./controller/waterflow');
var luces = require('./controller/luces');
router.route('/humedad')
    .get(humedad.stream);
router.route('/waterflow')
    .get(waterflow.stream);
router.route('/luz')
    .post(luces.stream);


// Export API routes
module.exports = router;