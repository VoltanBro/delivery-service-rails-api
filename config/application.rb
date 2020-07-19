# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DeliveryApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.generators.system_tests = nil
    # config.autoloader = :classic
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "/api/*",
                 headers: %w(Authorization),
                 methods: :any,
                 expose: %w(Authorization),
                 max_age: 600
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
