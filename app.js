var express = require('express');
var app = express();
var port =1234;
var Gallery = require('express-photo-gallery');

var options = {
  title: 'My Awesome Photo Gallery'
};

//app.use('/photos', Gallery('/home/joanmirochen/downloads/美女', options));
app.use('/photos', Gallery('./photos', options));

console.log('port number = ' + port);
app.listen(port);
