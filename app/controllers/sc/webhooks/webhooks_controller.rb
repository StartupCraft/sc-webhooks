# frozen_string_literal: true

module SC::Webhooks
  class WebhooksController < ActionController::Metal
    def event
      webhook_id = params.fetch(:webhook_id)

      ::SC::Webhooks::EventAction.new(webhook_id: webhook_id).call(request) do |monad|
        ::SC::Webhooks::ResponseHandler.new.call(webhook_id, self, monad)
      end
    end
  end
end
