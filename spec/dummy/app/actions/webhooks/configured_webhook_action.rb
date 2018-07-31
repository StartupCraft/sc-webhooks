# frozen_string_literal: true

module Webhooks
  class ConfiguredWebhookAction
    include Dry::Transaction

    def call(params)
      Success(true)
    end
  end
end
