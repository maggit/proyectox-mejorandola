if Rails.env == "production"
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS_WORKER = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  REDIS_WORKER = Redis.new(:url => 'redis://127.0.0.1:6379/12', :namespace => 'mejorandola')
end