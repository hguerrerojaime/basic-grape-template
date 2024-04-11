# frozen_string_literal: true

require 'dry/system'
require_relative 'helpers/dry'

class Application < Dry::System::Container
  extend Helpers::Dry

  # ********  Application settings *********
  # For reference see: For reference see: https://dry-rb.org/gems/dry-configurable/1.0/
  setting :database do
    setting :dsn, default: 'sqlite:memory'
  end

  setting :cors do
    setting :allowed_origins
  end

  setting :killbill do
    setting :url, default: 'http://killbill:8080'
  end
  # ****************************************

  configure do |config|
    config.name = 'subman'
    config.component_dirs.add('components')
    load_from_env!(config, env_prefix: 'SUBMAN_')
  end
end
