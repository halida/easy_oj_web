source 'http://ruby.taobao.org/'
# source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'mysql2', '>= 0.3'

gem 'devise', '1.4.7'
gem "cancan"
gem 'rails_admin', github: 'halida/rails_admin'

gem 'redcarpet', '1.17.2'
gem 'will_paginate', '~> 3.0.pre2'
gem 'settingslogic'
gem 'cache_digests'
gem 'jbuilder'
gem "truncate_html", "~> 0.5.4"
gem 'will_paginate', '~> 3.0.pre2'

gem 'sidekiq'
gem 'slim'
# if you require 'sinatra' you get the DSL extended to Object
gem 'sinatra', '>= 1.3.0', :require => nil

gem 'haml'
gem 'haml-rails'
gem 'formtastic'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :development, :test do
  gem 'unicorn'
  gem 'rspec'
  gem 'rspec-rails', "~> 2.6"
  gem 'sextant'
end
