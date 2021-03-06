$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'vcr'
require 'webmock/rspec'
require 'rash'
require 'edelements'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

WebMock.disable_net_connect!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_tapes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    #record:                      (ENV['TRAVIS'] ? :none : :once)
    record:                      :new_episodes
    #record:                      :all
    #record:                      :none
  }

  c.filter_sensitive_data("<API_KEY>") { Edelements.options[:api_key] }
end

RSpec.configure do |config|
  config.include EdelementsHelper
  config.color_enabled = true
  config.tty = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = "random"
end
