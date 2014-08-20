if Rails.env == "production"
  Sidekiq.configure_server do |config|
    config.redis = { :url => ENV["REDISTOGO_URL"] , :namespace => 'mejorandola' }
    db_config = YAML.load_file("#{Rails.root}/config/database.yml")[Rails.env]
    db_config["pool"] = 25
    ActiveRecord::Base.establish_connection(db_config)
  end
  Sidekiq.configure_client do |config|
    config.redis = { :url => ENV["REDISTOGO_URL"] , :namespace => 'mejorandola' }
  end
else
  Sidekiq::Logging.logger.level = Logger::DEBUG
  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://127.0.0.1:6379/12', :namespace => 'mejorandola' }
  end
  Sidekiq.configure_client do |config|
    config.redis = { :url => 'redis://127.0.0.1:6379/12', :namespace => 'mejorandola' }
  end
end