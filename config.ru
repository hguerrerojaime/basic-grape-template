# frozen_string_literal: true

require 'rack/cors'
require_relative 'boot'

use Rack::Cors do
  config = Application.config
  allowed_origins = config.cors.allowed_origins.to_s.split(',').map(&:strip)
  allowed_origins.to_a.each do |origin|
    allow do
      origins origin
      resource '*', headers: :any, methods: %i[get post put patch delete options]
    end
  end
end

run Root
