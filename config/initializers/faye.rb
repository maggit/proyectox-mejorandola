if Rails.env == "production"
  FAYE_SERVER = ENV["FAYE_SERVER_URL"]
else
  FAYE_SERVER = 'http://localhost:8000/'
end