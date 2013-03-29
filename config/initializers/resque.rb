require 'resque'
Resque.redis = Redis.new host: Settings.redis.host, port: Settings.redis.port
Resque.redis.namespace = "resque:env_#{Rails.env}:easy_oj_web"
