require 'spec_helper'

describe Edelements::Api::Organizations do

  before { set_testing_configuration }

  context '#list' do
    let(:organizations){ Edelements.organizations.list }

    it "should return not empty array" do
      VCR.use_cassette("organizations") do
        expect(organizations.data).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("organizations") do
        expect(organizations.data).to be_an_instance_of( Array )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('organizations') do
        expect(organizations.data.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('organizations') do
        expect(organizations.data[0].organization).to respond_to(:id)
      end
    end

    it 'should has nameField key' do
      VCR.use_cassette('organizations') do
        expect(organizations.data[0].organization).to respond_to(:nameField)
      end
    end

    it 'should has typeField key' do
      VCR.use_cassette('organizations') do
        expect(organizations.data[0].organization).to respond_to(:typeField)
      end
    end
  end
end
