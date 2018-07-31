# frozen_string_literal: true

class WebhooksController < ActionController::Metal
  def event
    ::Webhooks::EventAction.new(webhook_id: params.fetch(:webhook_id)).call(request) do |m|
      m.success do
        self.status = 200
      end

      m.failure :match_webhook do
        self.status = 404
      end

      m.failure do
        self.status = 400
      end
    end
  end
end
