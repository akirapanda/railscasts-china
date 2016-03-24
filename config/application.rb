require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailscastsChina
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.helper false
      g.view_specs false
      g.helper_specs false
    end


    config.active_record.raise_in_transactional_callbacks = true


    #i18n setting
    config.i18n.load_path += Dir[Rails.root.join('config','locales', '**/*.{rb,yml}').to_s]
    config.i18n.default_locale = :"zh-CN"

    #mysql database time_zone to be +8
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
  end
end
