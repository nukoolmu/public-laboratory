const express = require('express');
const kafka = require('kafka-node');
const bodyParser = require('body-parser');

const app = express();
const Producer = kafka.Producer;
const client = new kafka.KafkaClient({kafkaHost: 'kafka:9092'});
const producer = new Producer(client);

app.use(express.json());

// Define a route for sending messages to Kafka
app.post('/messages', function (req, res) {
  const message = req.body;

  // Send the message to a Kafka topic
  const payloads = [
    {
      topic: 'my-topic',
      messages: JSON.stringify(message)
    }
  ];

  producer.send(payloads, function (err, data) {
    if (err) {
      console.error('Error sending message to Kafka', err);
      res.status(500).json({ error: 'Error sending message to Kafka' });
    } else {
      console.log('Message sent to Kafka', data);
      res.json({ success: true });
    }
    
  });
});

// Start the server
app.listen(3000, function () {
  console.log('Server started on port 3000');
});
