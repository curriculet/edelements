module Edelements
  module Api
    class Events < Resource
      api_model Edelements::Event

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      def eventtypes
        response = @client.get( "#{ api_model.api_path }/eventtypes" )
        api_model.parse(response.body)
      end

      def webhooks
        response = @client.get( "#{ api_model.api_path }/webhooks" )
        api_model.parse(response.body)
      end
    end
  end
end
