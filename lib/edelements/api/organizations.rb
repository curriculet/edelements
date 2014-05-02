module Edelements
  module Api
    class Organizations < Resource
      api_model Edelements::Organization

      def list
        response = @client.get( api_model.api_path )
        api_model.parse(response.body)
      end
    end
  end
end
