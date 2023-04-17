const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(express.json());

app.post('/be/api-1', function (req, res) {
 
    res.json({ 
        success: true,
        resonse: "backend-api1",
     });
    
});

app.post('/be/api-2', function (req, res) {
 
    res.json({ 
        success: true,
        resonse: "backend-api2",
     });
    
});
// Start the server
app.listen(3000, function () {
  console.log('Server started on port 3000');
});
