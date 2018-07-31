# SC::Webhooks
Short description and motivation.

## Usage

1. Mount routes

```
Rails.application.routes.draw do
  ...
  mount SC::Webhooks::Engine => '/'
end
```

It will generate:
```
  POST /webhooks/:webhook_id(.:format) sc/webhooks/webhooks#event
```

2. Configure webhook path and class-handler
```
# config/initializers/sc-webhooks.rb
SC::Webhooks.configure do |config|
  config.handlers = {
    '97775f509d7e84363aad6a6dc2e12472' => ::Webhooks::ConfiguredWebhookAction
  }
end
```

It will move `POST /webhooks/97775f509d7e84363aad6a6dc2e12472` request to ::Webhooks::ConfiguredWebhookAction class

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sc-webhooks'
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
