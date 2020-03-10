require_relative 'boot'

require 'rails/all'
require 'csv'

Bundler.require(*Rails.groups)

module WebsiteTeacherZz
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :vi
    config.assets.version = '1.0'
    config.assets.paths << Rails.root.join('vendor', 'assets', 'node_modules')
  end
end
