source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

# Postgres for ActiveRecord
gem 'pg'

# Devise for authorization
gem 'devise'

# Gems for image upload
gem 'carrierwave'

# Cloud services library for aws
gem "fog", "~> 1.3.1"

# Ace for text editing
gem 'jquery-ace-rails'

# Sandboxing for the ruby eval
gem 'sandboxed'

# Enable Sass-based stylesheets
gem 'sass-rails', '~> 4.0.3'

# Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# jQuery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :doc do
  # Bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Loads environment variables from .env into ENV in development and test
  gem 'dotenv-rails'
  # Rspec testing framework
  gem 'rspec-rails'
  # Automate generation of entity relationship diagram, use rake erd command
  gem 'rails-erd'
  # Factory girl for better testing
  gem 'factory_girl_rails'
  # Mute asset pipeline log
  gem 'quiet_assets'
  # pry for debugging
  gem 'pry'
  # pry-rails for debugging
  gem 'pry-rails'
end

group :production do
  # rails_12factor gem to work with heroku
  gem 'rails_12factor'
end