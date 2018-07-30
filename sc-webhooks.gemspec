# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require 'sc/webhooks/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'sc-webhooks'
  s.version     = SC::Webhooks::VERSION
  s.authors     = ['Vadim Shalamov']
  s.email       = ['vadshalamov@gmail.com']
  s.homepage    = 'https://github.com/StartupCraft/sc-webhooks'
  s.summary     = 'Gem contains webhooks implementation for StartupCraft projects.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'pg', '>= 0.20'
  s.add_dependency 'rails', '>= 5.1', '< 6.0'

  s.add_development_dependency 'factory_bot_rails', '~> 4.8'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rspec-rails', '~> 3.7'
  s.add_development_dependency 'rubocop', '~> 0.58'
end
