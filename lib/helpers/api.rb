# frozen_string_literal: true

require 'grape'
require_relative '../application'

module Helpers
  ##
  # Api Helpers, intended for usage inside Grape
  #
  module Api
    ##
    # Resolve:
    # resolves a component from the application container
    def r(component)
      Application[component]
    end

    def config
      Application.config
    end
  end
end
