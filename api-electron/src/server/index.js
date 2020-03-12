const app = require('express')();
const http = require('http').createServer(app);
const io = require('socket.io')(http);

const userList = [];

io.on('connection', function(socket) {
  socket.on('clientSendMessage', function(message) {
    socket.broadcast.emit('clientReceiveMessage', message);
  });

  socket.on('userConnected', username => {
    const channel = userNameNotInUse(username)
      ? 'userConnectionCorrect'
      : 'usernameConnectionFailed';
    socket.emit(channel);
  });

  socket.on('registerUser', username => {
    console.log('User connected', username);
    userList.push({ id: socket.id, username });
    sendUserListToClients();
    console.log('Connection');
    console.log(userList);
  });

  socket.on('disconnect', () => {
    const userIndex = userList.findIndex(({ id }) => {
      console.log('Socket id:', socket.id);
      console.log(socket.id === id);
      return socket.id === id;
    });
    console.log('<------>');
    console.log(userIndex);
    if (userIndex >= 0) {
      userList.splice(userIndex, 1);
      sendUserListToClients();
      console.log('Disconnected succesfully');
    }

    console.log('Disconnection');
    console.log(userList);
  });
});

function userNameNotInUse(wantedUsername) {
  return !userList.find(({ username }) => username === wantedUsername);
}

function sendUserListToClients() {
  const usernamesList = userList.reduce((list, { username }) => {
    list.push(username);
    return list;
  }, []);
  io.sockets.emit('updateConnectedUserList', usernamesList);
}

http.listen(3000, function() {
  console.log('listening on *:3000');
});
