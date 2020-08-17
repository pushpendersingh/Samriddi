/*eslint no-console: 0*/
"use strict";

var http = require("http");
var springedge = require('springedge');
var port = process.env.PORT || 3000;

http.createServer(function (req, res) {

	var params = {
	  'apikey': '6ms0gt855d4aa4q708n72m33k214568m1', // API Key
	  'sender': 'SEDEMO', // Sender Name
	  'to': [
	    '919886266695'  //Moblie Number
	  ],
	  'message': 'Hi, this is a test message from spring edge',
	  'format': 'json'
	};
	 
	springedge.messages.send(params, 5000, function (err, response) {
	  if (err) {
	    return console.log(err);
	  }
	  console.log(response);
	    res.writeHead(200, {"Content-Type": "text/plain"});
		res.end("SMS sent successfully.\n");
	});	
}).listen(port);

console.log("Server listening on port %d", port);
