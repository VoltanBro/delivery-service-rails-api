# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require "utf8-cleaner"
use UTF8Cleaner::Middleware
run Rails.application
