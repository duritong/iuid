$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'mocha'
require 'iuid'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

def default_config
  @default_config ||= YAML.load(File.read(File.expand_path(base_dir+'/lib/iuid/default_config.yaml')))
end

def test_config
  return @config unless @config.nil?
  @config = default_config
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
  File.dirname(__FILE__)+'/../'
end
