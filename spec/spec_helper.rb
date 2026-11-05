# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'jruby' if Object.const_defined?(:RUBY_ENGINE) && RUBY_ENGINE == 'jruby'
require 'rspec'
require 'rspec/pending_for'
require 'yaml'
require 'iuid'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

def default_config
  @default_config ||= begin
    file = File.expand_path(File.join(base_dir, 'lib/iuid/default_config.yaml'))
    YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(File.read(file)) : YAML.load(File.read(file))
  end
end

def test_config
  return @config unless @config.nil?

  @config = default_config.dup
  @config['categories'] = {
    'global' => 100,
    'global2' => 200,
    'global3' => 201,
    'max' => 4294967295
  }
  @config['adapter'] = :Memory
  @config.delete('adapter_options')
  @config
end

def base_dir
  File.join(File.dirname(__FILE__), '..')
end
