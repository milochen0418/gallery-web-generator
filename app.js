var express = require('express');
var app = express();
var port =1234;
var subdir='ALL';
var Gallery = require('express-photo-gallery');

var options = {
  title: 'Awesome Photo Gallery from Google'
};


const args = require('minimist')(process.argv.slice(2));


if ( typeof(args['port'])  != "undefined" ) {
	port=args['port']
	console.log('port is defined as ' + port);
}

if ( typeof(args['subdir'])  != "undefined" ) {
	subdir=args['subdir']
	console.log('subdir is defined as ' + subdir);
}


app.use('/', Gallery('./photos/'+subdir, options));

console.log('port number = ' + port + ' to show gallery = ' + subdir);
app.listen(port);

// There some examples to start web server by command line here
// $ node ./app.js --port=8866 --subdir=校花
// $ node ./app.js
// $ node ./app.js --port=5566
