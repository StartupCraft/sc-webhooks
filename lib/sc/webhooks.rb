# frozen_string_literal: true

require 'sc/webhooks/railtie'
require 'sc/webhooks/engine'

require 'dry-configurable'
require 'dry-transaction'

module SC
  module Webhooks
    extend Dry::Configurable

    setting :handlers, {}, reader: true
  end
end
