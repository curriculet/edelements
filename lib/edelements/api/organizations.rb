module Edelements
  module Api
    class Organizations < Resource
      api_model Edelements::Organization

      def list
        response = @client.get( api_model.api_path )
        api_model.parse(response.body)
      end

      def show organization_id
        response = @client.get( "#{ api_model.api_path }/b8eaf45c-cca9-11e3-97de-22000aa43193" )
        api_model.parse(response.body)
      end
    end
  end
end
