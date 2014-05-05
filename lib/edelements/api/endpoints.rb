module Edelements
  module Api
    module Endpoints
      def organizations
        @organizations ||= Edelements::Api::Organizations.new( client )
      end

      def schools
        @schools ||= Edelements::Api::Schools.new( client )
      end
    end
  end
end
