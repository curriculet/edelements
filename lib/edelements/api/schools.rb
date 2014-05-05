module Edelements
  module Api
    class Schools < Resource
      api_model Edelements::School

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      def teachers id
        response = @client.get( "#{ api_model.api_path }/#{ id }/teachers" )
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
    end
  end
end
