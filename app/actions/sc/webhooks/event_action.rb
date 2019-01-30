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
      handler = choose_handler(webhook_id)

      if handler.present?
        Success(input: input, handler: handler)
      else
        Failure(false)
      end
    end

    def choose_handler(webhook_id)
      handler = handlers[webhook_id]

      handler.is_a?(Hash) ? handler.fetch(:action_class) : handler
    end

    def handle(input:, handler:)
      handler.new.call(input)
    end
  end
end
