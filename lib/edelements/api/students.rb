module Edelements
  module Api
    class Students < Resource
      api_model Edelements::Student

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      def teachers id
        response = @client.get( "#{ api_model.api_path }/#{ id }/teachers" )
        api_model.parse(response.body)
      end

      def courses id
        response = @client.get( "#{ api_model.api_path }/#{ id }/courses" )
        api_model.parse(response.body)
      end

      def events id
        response = @client.get( "#{ api_model.api_path }/#{ id }/events" )
        api_model.parse(response.body)
      end

      def properties params
      end

      def photo id
        response = @client.get( "#{ api_model.api_path }/#{ id }/photo" )
        api_model.parse(response.body)
      end

      def activity id
        response = @client.get( "#{ api_model.api_path }/#{ id }/activity" )
        api_model.parse(response.body)
      end
    end
  end
end
