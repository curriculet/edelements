module Edelements
  module Api
    module Endpoints


      # organizations
      #
      # @example
      #   Edelements.organizations.show( organization_id ) returns the details of organization
      #
      # @return [Edelements::Api::Organizations] A properly initialized organizations api client ready for calls


      def organizations
        @organizations ||= Edelements::Api::Organizations.new( client )
      end


      # schools
      #
      # @example
      #   Edelements.schools.show( school_id ) returns the details of school
      #
      # @return [Edelements::Api::Schools] A properly initialized schools api client ready for calls


      def schools
        @schools ||= Edelements::Api::Schools.new( client )
      end


      # teachers
      #
      # @example
      #   Edelements.teachers.students( teacher_id ) returns all students those related with teacher
      #
      # @return [Edelements::Api::Teachers] A properly initialized teachers api client ready for calls


      def teachers
        @teachers ||= Edelements::Api::Teachers.new( client )
      end


      # students
      #
      # @example
      #   Edelements.students.list returns all students
      #
      # @return [Edelements::Api::Students] A properly initialized students api client ready for calls


      def students
        @students ||= Edelements::Api::Students.new( client )
      end


      # courses
      #
      # @example
      #   Edelements.courses.students( course_id ) returns all students those related with course
      #
      # @return [Edelements::Api::Courses] A properly initialized courses api client ready for calls


      def courses
        @courses ||= Edelements::Api::Courses.new( client )
      end


      # events
      #
      # @example
      #   Edelements.events.show( event_id ) returns the details of event
      #
      # @return [Edelements::Api::Events] A properly initialized events api client ready for calls


      def events
        @events ||= Edelements::Api::Events.new( client )
      end
    end
  end
end
