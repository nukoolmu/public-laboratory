// Import the Express module
const express = require('express');

// Create an Express application
const app = express();

// Middleware to parse JSON requests
app.use(express.json());

// Define a route to handle POST requests to /logs
app.post('/be', (req, res) => {
    // Log the request headers along with any log data received
    console.log('Received log data:', req.body);
    console.log('Request headers:', req.headers);

    // Respond with a success message
    res.status(200).send('Log received successfully.');
});

// Start the server and listen on port 3000
const port = 80;
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
