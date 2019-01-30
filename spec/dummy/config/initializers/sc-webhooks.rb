# frozen_string_literal: true

SC::Webhooks.configure do |config|
  config.handlers = {
    'configured_webhook' => ::Webhooks::ConfiguredWebhookAction,
    'webhook_with_custom_response' => {
      action_class: ::Webhooks::ConfiguredWebhookAction,
      response_handler: ->(context, monad) do
        monad.success do
          context.status = 200
          context.response_body = 'Hey there!'
        end

        monad.failure do
          context.status = 400
        end
      end
    }
  }
end
