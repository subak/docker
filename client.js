var WebSocket = require('ws'),
  ws = new WebSocket('ws://15.core:6001'),
  spawn = require('child_process').spawn;

ws.on('open', function (m) {
  console.log(m);
});

ws.on('message', function (data) {
  var content = data.toString('utf8');
  console.log(content);
  var pbcopy = spawn('pbcopy');
  pbcopy.stdin.write(content);
  pbcopy.stdin.end();
});