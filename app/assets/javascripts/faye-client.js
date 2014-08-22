$(function() {
  var faye = new Faye.Client(FAYE_SERVER);
  faye.subscribe('/chatroom', function (data) {
    var object = JSON.parse(data);
    $('#chat_messages').append("<li class='list-group-item'> <b>@" + object["username"] + "</b>: " + object["message"] + "</li>");
  });
});