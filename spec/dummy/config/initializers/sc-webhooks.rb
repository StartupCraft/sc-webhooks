# frozen_string_literal: true

SC::Webhooks.configure do |config|
  config.handlers = {
    'configured_webhook' => ::Webhooks::ConfiguredWebhookAction
  }
end
