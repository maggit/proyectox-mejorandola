var faye = new Faye.Client("<%= @host %>");
faye.publish("/chatroom", "<%= escape_javascript(sanitize(@message)%>"));