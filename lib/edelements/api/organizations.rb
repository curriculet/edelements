module Edelements
  module Api
    class Organizations < Resource
      api_model Edelements::Organization

      def list
        response = @client.get( api_model.api_path )
        api_model.parse(response.body)
      end

      def show organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }" )
        api_model.parse(response.body)
      end

      def organizations organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }/organizations" )
        api_model.parse(response.body)
      end

      def schools organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }/schools" )
        api_model.parse(response.body)
      end

      def teachers organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }/teachers" )
        api_model.parse(response.body)
      end

      def students organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }/students" )
        api_model.parse(response.body)
      end

      def courses organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }/courses" )
        api_model.parse(response.body)
      end

      def events organization_id
        response = @client.get( "#{ api_model.api_path }/#{ organization_id }/events" )
        api_model.parse(response.body)
      end
    end
  end
end
