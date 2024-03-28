const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = 3000;

app.use(bodyParser.json());

// Define a route for the homepage
app.get('/getdata', (req, res) => {
  res.send('Hello This message return for GET Method');
});

app.post('/postdata', (req, res) => {
    const { name, email } = req.body;
    console.log(`Received submission: Name - ${name}, Email - ${email}`);

    res.send('Hello This message return for POST Method');
  });
// Start the server
app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});
