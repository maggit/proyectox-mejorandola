class LandingController < ApplicationController

  def index
  end

  def chat
    #Pretty funny: <script>alert('I steal cookies!')</script>
    username = Sanitize.clean(params[:username])
    msg =  Sanitize.clean(params[:message])

    message = {message: msg, username: username}.to_json

    host =   FAYE_SERVER
    EM.run do
      client = Faye::Client.new(host)
      publication = client.publish("/chatroom", message)
      publication.callback do
        puts "[PUBLISH SUCCEEDED] - #{@message}"
        EM.stop_event_loop
      end
      publication.errback do |error|
        puts "[PUBLISH FAILED] #{error.inspect}"
        EM.stop_event_loop
      end
    end
    respond_to do |format|
      format.js {}
    end
  end

end