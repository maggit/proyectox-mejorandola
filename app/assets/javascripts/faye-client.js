$(function() {
  $('#send_chat_message').on('click', null, function() {
    var faye = new Faye.Client('http://peaceful-escarpment-2136.herokuapp.com/');
    faye.publish('/chatroom', {
      userId: $('#chat_username').val(),
      message: $('#chat_message').val()
    });
  });

  var faye = new Faye.Client('http://peaceful-escarpment-2136.herokuapp.com/');
  faye.subscribe('/chatroom', function (data) {
    $('#chat_messages').append("<li class='list-group-item'> <b>@" + data.userId + "</b>: " + data.message + "</li>");
  });
});