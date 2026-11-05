# frozen_string_literal: true

source 'https://rubygems.org'

# This will load dependencies from iuid.gemspec
gemspec

# JRuby specific dependencies that are not needed as part of the gem
if defined?(RUBY_ENGINE) && (RUBY_ENGINE == 'jruby')
  gem 'jruby-openssl'
end
