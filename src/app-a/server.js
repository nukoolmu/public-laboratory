var express = require('express');
var app = express();

app.get('/be-1', function(req, res){
   res.send("Hello BE-1");
});

app.listen(3000);