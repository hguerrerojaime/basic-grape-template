# frozen_string_literal: true

require 'grape'
require './lib/helpers/api'

class Root < Grape::API
  format :json

  helpers ::Helpers::Api

  get :greet do
    { message: r('service.hello').greet('subman') }
  end

  get :health_check do
    { status: 'healthy' }
  end
end
