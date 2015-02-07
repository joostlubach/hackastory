var WebSocketServer = require('websocket').server;
var http = require('http');

var server = http.createServer(function(request, response) {
  if (request.url == '/send') {
    var body = '';
    request.on('data', function (data) {
      body += data;
    });
    request.on('end', function () {
      sendNotification(body);

      response.writeHead(200, {'Content-Type': 'application/json'});
      response.end('{"message": "ok"}');
    });
  } else {
    response.writeHead(404);
    response.end();
  }
});
server.listen(1337, '10.10.150.134');

// create the server
wsServer = new WebSocketServer({
  httpServer: server
});

var connections = [];

// WebSocket server
wsServer.on('request', function(request) {
  var connection = request.accept(null, request.origin);

  console.log((new Date()) + ' Connect:' + request.origin + '.');
  connections.push(connection);

  connection.on('close', function(connection) {
    console.log((new Date()) + ' Terminate:' + request.origin);

    var idx = connections.indexOf(connection);
    connections.splice(idx, 1);
  });
});

function sendNotification(body) {

  console.log((new Date()) + ' Send:' + body + '.');

  var connection;
  for (var i = 0; i < connections.length; i++) {
    connection = connections[i];
    connection.sendUTF(body);
  }

}