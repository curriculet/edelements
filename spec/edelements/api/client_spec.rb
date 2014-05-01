require 'spec_helper'

describe Edelements::API::Client do

  let(:client){
    Edelements::API::Client.new( Edelements )
  }


  describe 'initialization' do
    describe 'via configure' do
      context "should be initialized by config" do
        before do
          set_testing_configuration
          @cli = Edelements.configure do |c |
                c.api_key  = edelements_api_key
                c.testing  = true
          end
          @options_hash = @cli.class.default_options
        end

        it { expect(@cli).to_not be_nil }
        it { expect(@options_hash[:base_uri]).to eq Edelements.api_url }
        it { expect(@options_hash[:default_params]).to be_nil }
        it { expect(@options_hash[:debug_output]).to_not be_nil }
        it { expect(@options_hash[:headers]).to_not be_nil }
        it { expect(@options_hash[:headers]['User-Agent']).to_not be_nil }
      end
    end

    context 'should be initialized via hash' do
      before do
        configuration_hash = {
            endpoint:    'https://example.com',
            api_version: 'v52',
            api_key:     'my_edmodo_api_key',
            testing:      true
        }
        @options_hash = client.class.default_options
        @client = Edelements::API::Client.new( configuration_hash )
      end

      it{ expect(@client).to_not be_nil }
      it{ expect(@options_hash[:base_uri]).to eq 'https://example.com/v52' }
      it{ expect(@options_hash[:default_params]).to be_nil }
      it{ expect(@options_hash[:debug_output]).to_not be_nil }
    end
  end

  describe "get" do
    #
    # Because of the conflict of Excon.stubs with VCR (they do not work at the same time)
    # We created a errors.yml file by hand to simulate stubs that always return the desired error code
    #
    it "should not raise an exception with response status 200" do
      VCR.use_cassette("errors") do
        expect{ client.get("/organizations.json") }.not_to raise_error
      end
    end
    #it "should raise Edelements::BadRequest with response status is 400" do
      #VCR.use_cassette("errors") do
        #expect{ client.get("/400") }.to raise_error  Edelements::BadRequest
      #end
    #end
    #it "should raise Edelements::AuthenticationFailed with response status is 401" do
      #VCR.use_cassette("errors") do
        #expect{ client.get("/401") }.to raise_error  Edelements::AuthenticationFailed
      #end
    #end
    it "should raise Edelements::NotFound with response status is 404" do
      VCR.use_cassette("errors") do
        expect{ client.get("/404") }.to raise_error  Edelements::NotFound
      end
    end
    #it "should raise Edelements::ServerError with response status is 500" do
      #VCR.use_cassette("errors") do
        #expect{ client.get("/500") }.to raise_error  Edelements::ServerError
      #end
    #end
    #it "should raise Edelements::Unavailable with response status is 502" do
      #VCR.use_cassette("errors") do
        #expect{ client.get("/502") }.to raise_error  Edelements::Unavailable
      #end
    #end
    #it "should raise Edelements::UnknownStatusCode. with response status is not listed above" do
      #VCR.use_cassette("errors") do
        #expect{ client.get("/499") }.to raise_error  Edelements::UnknownStatusCode
      #end
    #end
  end
end
