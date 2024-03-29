require_relative "boot"

require "rails"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_record/railtie"
require "active_storage/engine"

Bundler.require(*Rails.groups)

module Volanty
  class Application < Rails::Application
    config.load_defaults 6.1

    config.api_only = true
  end
end
