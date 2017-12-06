// Dependencies
var express = require('express');
var bodyParser = require('body-parser');
var path = require('path');

var app = express();

// Body Parser MiddleWare
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));

// Set static path
app.use(express.static(path.join(__dirname, '../client')));

var userDetailsRouter = require('./routes/UserDetailsRouter');
app.use('/userDetails', userDetailsRouter);

// Render index.html on the main page
app.get('*', function(req, res) {
	res.sendFile("index.html", {root: '../client'});
});

//Removes the X-Powered-By: Express header from all the requests
app.disable('x-powered-by');

//Start Server
app.listen(3000, function() {
	console.log('server started at port 3000');
});