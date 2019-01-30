# frozen_string_literal: true

module SC::Webhooks
  class ResponseHandler
    def call(webhook_id, context, monad)
      handler = choose_response_handler(webhook_id)
      handler.call(context, monad)
    end

    private

    DEFAULT_RESPONSE_HANDLER = lambda do |context, monad|
      monad.success do
        context.status = 200
      end

      monad.failure :match_webhook do
        context.status = 404
      end

      monad.failure do
        context.status = 400
      end
    end

    private_constant :DEFAULT_RESPONSE_HANDLER

    def choose_response_handler(webhook_id)
      handler = SC::Webhooks.handlers[webhook_id]

      if handler.is_a?(Hash) && handler.key?(:response_handler)
        handler.fetch(:response_handler)
      else
        DEFAULT_RESPONSE_HANDLER
      end
    end
  end
end
