var WebSocket = require('ws'),
  ws = new WebSocket('ws://localhost:49153'),
  spawn = require('child_process').spawn,
  os = require('os').platform();

ws.on('open', function (m) {
  console.log(m);
});

ws.on('message', function (data) {
  var content = data.toString('utf8');
  console.log(content);
  if (os.match(/^win/)) {
    var clip = spawn('clip');
    clip.stdin.write(content);
    clip.stdin.end();
  } else {
    var pbcopy = spawn('pbcopy');
    pbcopy.stdin.write(content);
    pbcopy.stdin.end();
  }
});