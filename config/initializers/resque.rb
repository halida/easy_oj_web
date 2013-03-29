require 'resque'
Resque.redis.namespace = "resque:env_#{Rails.env}:easy_oj_web"
