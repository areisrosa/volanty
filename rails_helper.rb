# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

RSpec.configure do |config|
  config.use_active_record = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

