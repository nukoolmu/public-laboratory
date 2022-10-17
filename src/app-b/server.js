var express = require('express');
var app = express();

app.get('/be-2', function(req, res){
   res.send("Hello BE-2");
});

app.listen(3000);