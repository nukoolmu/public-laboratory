var express = require('express');
var app = express();

app.get('/be-1', function(req, res){
   res.send("Hello BE-1");
});



app.get('/nukoolmu', function(req, res){

   res.send("Hello nukoolmu");
});
app.listen(3000);
