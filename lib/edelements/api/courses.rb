module Edelements
  module Api
    class Courses < Resource
      api_model Edelements::Course

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

      def events id
        response = @client.get( "#{ api_model.api_path }/#{ id }/events" )
        api_model.parse(response.body)
      end

      def add_properties id, property
        response = @client.put( "#{ api_model.api_path }/#{ id }/properties/#{ property }" )
        api_model.parse(response.body)
      end
    end
  end
end
