# frozen_string_literal: true

RSpec.describe 'Webhooks' do
  describe 'POST webhooks/webhook_path' do
    subject(:do_request) do
      post '/webhooks/configured_webhook', headers: {}, params: {}
    end

    it 'calls proper handler class' do
      expect_any_instance_of(::Webhooks::ConfiguredWebhookAction).to receive(:call).and_call_original

      do_request

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST webhooks/unknown' do
    subject(:do_request) do
      post '/webhooks/unknown', headers: {}, params: {}
    end

    it 'calls proper handler class' do
      do_request

      expect(response).to have_http_status(:not_found)
    end
  end
end
