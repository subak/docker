var net = require('net'),
  ws = require('ws'),
  sender = new ws.Server({ port: 6001 });

sender.on('connection', function (ws) {
  // 日付、どのclientからコネクションがあったかを出力
  // execSyncを使う。ただし0.11から使える
  console.log('connect');
});

var receiver = new net.createServer(function (c) {
  c.on('data', function (data) {
    // echo
    c.write(data);

    sender.clients.forEach(function (ws) {
      ws.send(data);
    });
  });
});

receiver.listen(6000, function() {
  console.log('bounded');
});
