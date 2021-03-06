# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
# swagger
gem "bootsnap", ">= 1.4.2", require: false
gem "rswag"
gem "pg"
gem "active_model_serializers"
# ActiveAdmin
gem "activeadmin"
# Plus integrations with:
gem "devise"
# Simple, multi-client and secure token-based authentication for Rails.
gem "devise-jwt"
gem "rack-cors"
# CanCanCan
gem "cancancan"
gem "draper"
gem "pundit"
# This gem provides a simple and extremely flexible way to upload files from Ruby applications
gem "carrierwave", "~> 1.0"
gem "utf8-cleaner"
# Use Puma as the app server
gem "puma", "~> 4.3.3"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :production, :test do
  gem "shoulda-matchers"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # gem 'rspec-rails', '~> 4.0.0'
  gem "rspec", "~> 3.9"
  gem "rspec-rails", "~> 4.0", ">= 4.0.1"
  # rspec
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
  gem "simplecov", require: false
end
# rubocop-rails
gem "rubocop-ci", git: "https://github.com/ad2games/rubocop-ci"
gem "rubocop-rails", require: false
gem "rubocop-performance"
# simplecov
gem "simplecov", require: false, group: :test
# brakeman
gem "brakeman", "~> 4.8", ">= 4.8.1"
# rswag
gem "erubis", "~> 2.7"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
