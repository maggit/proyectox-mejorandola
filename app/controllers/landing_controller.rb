class LandingController < ApplicationController

  def index
  end

  def chat
    @message = {:message => params[:message],:username => params[:username]}.to_json
    @host = "http://localhost:8000/"
  end

end