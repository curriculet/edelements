module Edelements
  module Api
    class Teachers < Resource
      api_model Edelements::Teacher

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      def students id
        response = @client.get( "#{ api_model.api_path }/#{ id }/students" )
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
