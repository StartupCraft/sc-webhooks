# frozen_string_literal: true

require 'sc/webhooks/railtie'
require 'sc/webhooks/engine'
require 'sc/webhooks/response_handler'

require 'dry-configurable'
require 'dry-transaction'

module SC
  module Webhooks
    extend Dry::Configurable

    setting :handlers, {}, reader: true
  end
end
