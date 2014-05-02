module Edelements
  module Api
    module Endpoints
      def organizations
        @organizations ||= Edelements::Api::Organizations.new( client )
      end
    end
  end
end
