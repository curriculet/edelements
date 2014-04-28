require 'spec_helper'

describe Edelements::Configuration do

  before do
    set_testing_configuration
  end

  describe '.configure' do
    Edelements::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        Edelements.configure do |config|
          if key == :timeout
            config.send("#{key}=", 10)
            expect(Edelements.send(key)).to eq 10
          else
            config.send("#{key}=", key)
            expect(Edelements.send(key)).to eq key
          end
        end
      end
    end
  end

  describe "default values" do
    before{ Edelements.reset! }
    Edelements::Configuration::VALID_CONFIG_KEYS.each do |key|
      describe ".#{key}" do
        it 'should return the default value' do
          expect(Edelements.send(key)).to eq Edelements::Configuration.const_get("DEFAULT_#{key.upcase}")
        end
      end
    end
  end
end
