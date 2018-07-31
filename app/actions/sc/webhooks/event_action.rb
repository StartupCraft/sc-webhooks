# frozen_string_literal: true

module SC::Webhooks
  class EventAction
    include Dry::Transaction

    delegate :handlers, to: :'SC::Webhooks'

    step :match_webhook
    step :handle

    attr_accessor :webhook_id
    private       :webhook_id

    def initialize(webhook_id:, **args)
      self.webhook_id = webhook_id

      super(args)
    end

    private

    def match_webhook(input)
      handler = handlers[webhook_id]

      if handler.present?
        Success(input: input, handler: handler)
      else
        Failure(false)
      end
    end

    def handle(input:, handler:)
      handler.new.call(input)
    end
  end
end
