# frozen_string_literal: true

module SC
  module Webhooks
    class Engine < ::Rails::Engine
      isolate_namespace SC::Webhooks

      config.generators do |g|
        g.test_framework :rspec
        g.fixture_replacement :factory_bot, dir: 'spec/factories'
      end
    end
  end
end
