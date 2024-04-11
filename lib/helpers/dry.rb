# frozen_string_literal: true

require 'dry/configurable'

module Helpers
  module Dry
    def load_from_env!(config_node, env_prefix: nil, namespace_separator: '__')
      config_node.values.each do |(k, v)| # rubocop:disable Style::HashEachMethod
        if v.is_a?(::Dry::Configurable::Config)
          load_from_env!(config_node[k.to_sym], env_prefix: "#{env_prefix}#{k.upcase}#{namespace_separator}")
        else
          config_node[k.to_sym] = ENV.fetch("#{env_prefix}#{k.upcase}", config_node[k.to_sym])
        end
      end
    end
  end
end
