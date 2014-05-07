module Edelements
  module Api
    module Endpoints
      def organizations
        @organizations ||= Edelements::Api::Organizations.new( client )
      end

      def schools
        @schools ||= Edelements::Api::Schools.new( client )
      end

      def teachers
        @teachers ||= Edelements::Api::Teachers.new( client )
      end

      def students
        @students ||= Edelements::Api::Students.new( client )
      end

      def courses
        @courses ||= Edelements::Api::Courses.new( client )
      end
    end
  end
end
