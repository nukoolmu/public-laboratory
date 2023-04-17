const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(express.json());

// Define a route for sending messages to Kafka
app.get('/', function (req, res) {
    res.json({
        success: true,
        reponse: "home"
    });
 
});

// Start the server
app.listen(3000, function () {
  console.log('Server started on port 3000');
});
