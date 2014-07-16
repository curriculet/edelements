require 'spec_helper'

describe Edelements::Api::Events ,  :vcr => { :cassette_name => "events" }  do

  before { set_testing_configuration }

  context '#show' do
    let(:event){ Edelements.events.show( edelements_event_id ) }

    it "should return not empty array" do
      expect(event).to_not be_nil
    end

    it 'should be Edelements::Event' do
      expect(event).to be_an_instance_of( Edelements::Event )
    end

    it 'should should be > 0' do
      expect(event.length).to_not be_zero
    end

    it 'should has id key' do
      expect(event).to respond_to(:id)
    end

    it 'should has timestamp key' do
      expect(event).to respond_to(:timestamp)
    end

    it 'should has eventtype key' do
      expect(event).to respond_to(:eventtype)
    end

    it 'should has eventaction key' do
      expect(event).to respond_to(:eventaction)
    end

    it 'should has params key' do
      expect(event).to respond_to(:params)
    end

    it 'should params[:userID] key' do
      expect(event.params).to respond_to(:userID)
    end
  end

  context '#eventtypes' do
    let(:eventtypes){ Edelements.events.eventtypes  }

    it 'should has eventtype key' do
      expect(eventtypes).to respond_to(:eventtype)
    end

    it 'should be array' do
      expect(eventtypes.eventtype).to be_an_instance_of( Array )
    end
  end

  context '#webhooks' do
    let(:webhooks){ Edelements.events.webhooks }

    it 'should be array' do
      expect(webhooks).to be_an_instance_of( Array )
    end

    it 'should be Edelements::Webhook' do
      expect(webhooks[0]).to be_an_instance_of( Edelements::Webhook )
    end

    it 'should has id key' do
      expect(webhooks[0]).to respond_to(:id)
    end

    it 'should has schoolID key' do
      expect(webhooks[0]).to respond_to(:schoolID)
    end

    it 'should has eventtype key' do
      expect(webhooks[0]).to respond_to(:eventtype)
    end

    it 'should has token key' do
      expect(webhooks[0]).to respond_to(:token)
    end


  end
end
