# frozen_string_literal: true

require 'json'
require 'pry'
require 'rack/test'
require './api/boot'

module ApiSpec
  include Rack::Test::Methods
  include Utils

  def app
    Routes::Root
  end
end
