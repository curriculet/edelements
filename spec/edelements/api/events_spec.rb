require 'spec_helper'

describe Edelements::Api::Events do

  before { set_testing_configuration }

  context '#show' do
    let(:event){ Edelements.events.show( edelements_event_id ) }

    it "should return not empty array" do
      VCR.use_cassette('events') do
        expect(event).to_not be_nil
      end
    end

    it 'should be array' do
      VCR.use_cassette("events") do
        expect(event).to be_an_instance_of( Edelements::Event )
      end
    end

    it 'should should be > 0' do
      VCR.use_cassette('events') do
        expect(event.length).to_not be_zero
      end
    end

    it 'should has id key' do
      VCR.use_cassette('events') do
        expect(event).to respond_to(:id)
      end
    end

    it 'should has timestamp key' do
      VCR.use_cassette('events') do
        expect(event).to respond_to(:timestamp)
      end
    end

    it 'should has eventtype key' do
      VCR.use_cassette('events') do
        expect(event).to respond_to(:eventtype)
      end
    end

    it 'should has eventaction key' do
      VCR.use_cassette('events') do
        expect(event).to respond_to(:eventaction)
      end
    end

    it 'should has params key' do
      VCR.use_cassette('events') do
        expect(event).to respond_to(:params)
      end
    end

    it 'should params[:userID] key' do
      VCR.use_cassette('events') do
        expect(event.params).to respond_to(:userID)
      end
    end
  end

  context '#eventtypes' do
    let(:eventtypes){ Edelements.events.eventtypes  }

    it 'should has eventtype key' do
      VCR.use_cassette('events') do
        expect(eventtypes).to respond_to(:eventtype)
      end
    end

    it 'should be array' do
      VCR.use_cassette('events') do
        expect(eventtypes.eventtype).to be_an_instance_of( Array )
      end
    end
  end

  context '#webhooks' do
    let(:webhooks){ Edelements.events.webhooks }

    it 'should return array' do
      VCR.use_cassette('events') do
        expect(webhooks).to respond_to(:data)
      end
    end

    it 'should be array' do
      VCR.use_cassette('events') do
        expect(webhooks.data).to be_an_instance_of( Array )
      end
    end

    it 'should has total key' do
      VCR.use_cassette('events') do
        expect(webhooks).to respond_to(:total)
      end
    end

    it 'should has page key' do
      VCR.use_cassette('events') do
        expect(webhooks).to respond_to(:page)
      end
    end
  end
end
