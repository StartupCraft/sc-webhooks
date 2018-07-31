# frozen_string_literal: true

SC::Webhooks::Engine.routes.draw do
  post 'webhooks/:webhook_id' => 'webhooks#event'
end
