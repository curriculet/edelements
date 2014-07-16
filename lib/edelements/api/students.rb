module Edelements
  module Api
    class Students < Resource
      api_model Edelements::Student

      # show
      #
      # Returns specific Student
      #
      # GET  /v1_0/students/{id}.json
      #
      #   {
      #     "schoolID": "abc-def-ghi",
      #     "id": "123-456-789",
      #     "firstName": "First",
      #     "lastName": "Last",
      #     "middleName": "Middle",
      #     "email": "email@email.eml",
      #     "number": "12345",
      #     "courseEnrollments": [
      #       {
      #         "enrollment": {
      #           "startDate": 1361779200000,
      #           "courseID": "asdf",
      #           "lastUpdate": ,
      #           "role": "student",
      #           "endDate":
      #         }
      #       },
      #       ...
      #     ],
      #     "address": {
      #       "street1": "123 Street",
      #       "street2": "#456",
      #       "city": "City",
      #       "state": "CA",
      #       "zip": "12345"
      #     },
      #     "properties": {
      #       "remoteID": "qwerty",
      #       "login": "userLogin",
      #       "password": <...encrypted...>
      #     },
      #     "lastUpdate":
      #   }
      #
      # Details
      #
      # @param id [Integer] the Student ID
      #

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      # teachers
      #
      # Returns all teachers of a specific student
      #
      # GET  /v1_0/students/{id}/teachers.json
      #
      #   {
      #     "data": [
      #       {
      #         "teacher": {
      #           "schoolID": "abc-def-ghi",
      #           "id": "AEC-JIKD-QIWEU",
      #           "firstName": "First",
      #           "lastName": "Last",
      #           "middleName": "Middle",
      #           "email": "email@email.eml",
      #           "number": "12345",
      #           "courseEnrollments": [
      #             {
      #               "enrollment": {
      #                 "startDate": 1353484800000,
      #                 "courseID": "asdf",
      #                 "lastUpdate": ,
      #                 "role": "Primary",
      #                 "endDate": 1353484800000
      #               }
      #             }
      #           ],
      #           "address": {
      #             "street1": "123 Street",
      #             "street2": "#456",
      #             "city": "City",
      #             "state": "CA",
      #             "zip": "12345"
      #           },
      #           "properties": {
      #             "remoteID": "qwerty",
      #             "login": "userLogin",
      #             "password": <...encrypted...>
      #           },
      #           "lastUpdate":
      #         }
      #       },
      #       ...
      #     ],
      #     "page": ,
      #     "total":
      #   }
      #
      # Details
      #
      # @param id [Integer] the Student ID
      #

      def teachers id
        response = @client.get( "#{ api_model.api_path }/#{ id }/teachers" )
        Edelements::Teacher.parse(response.body)
      end

      # courses
      #
      # Returns all courses of a specific student
      #
      # GET  /v1_0/students/{id}/courses.json
      #
      #   {
      #     "data": [
      #       {
      #         "course": {
      #           "schoolID": "abc-def-ghi",
      #           "id": "d53bfbc4-fbbf-41e5-aa0a-55be36bad769",
      #           "name": "LAN1400 C",
      #           "schoolYear": "2012-2013",
      #           "startDate": "YYYY-MM-DD",
      #           "endDate": "YYYY-MM-DD",
      #           "properties": {
      #             "parentCourseID": "d53bfbc4-fbbf-41e5-aa0a-55be36bad760"
      #           },
      #           "teacherEnrollments": [
      #             {
      #               enrollment: {
      #                 userID: guid,
      #                 role: primary/secondary,
      #                 startDate: ,
      #                 endDate: ,
      #                 lastUpdate:
      #               }
      #             },
      #             ...
      #           ],
      #           "studentEnrollments": [
      #             {
      #               enrollment: {
      #                 userID: guid,
      #                 role: student,
      #                 startDate: ,
      #                 endDate: ,
      #                 lastUpdate:
      #               }
      #             },
      #             ...
      #           ]
      #         }
      #       },
      #       ...
      #     ],
      #     "page": "1",
      #     "total":
      #   }
      #
      # Details
      #
      # @param id [Integer] the Student ID
      #

      def courses id
        response = @client.get( "#{ api_model.api_path }/#{ id }/courses" )
        Edelements::Course.parse(response.body)
      end

      # events
      #
      # Returns all events of a specific student
      #
      # GET  /v1_0/students/{id}/events.json
      #
      #   {
      #     "data": [
      #       {
      #         "events": {
      #           "id": "f287bd2c-b7e5-406f-9ccb-fe6b1ef4ad5d",
      #           "schoolID": "abc-def-ghi",
      #           "timestamp": 1369184896000,
      #           "eventtype": "COURSE ENROLLMENT",
      #           "eventaction": "UPDATE",
      #           "fields": {
      #             "userID": "33988216-0366-4dd7-8545-e917204cdf2e",
      #             "courseID": "49c2b0b2-c267-11e2-ae9e-f0def14820f1"
      #           }
      #         }
      #       },
      #       {
      #         "events": {
      #           "id": "b7f4bb46-8dec-4e86-888d-378ee93df943",
      #           "schoolID": "abc-def-ghi",
      #           "timestamp": 1369184896000,
      #           "eventtype": "COURSE ENROLLMENT",
      #           "eventaction": "CREATE",
      #           "fields": {
      #             "userID": "33988216-0366-4dd7-8545-e917204cdf2e",
      #             "courseID": "49c2b0b2-c267-11e2-ae9e-f0def14820f1"
      #           }
      #         }
      #       },
      #       {
      #         "events": {
      #           "id": "3880ad32-dcd8-4b41-86e5-d36dd298a6aa",
      #           "schoolID": "abc-def-ghi",
      #           "timestamp": 1369184944000,
      #           "eventtype": "STUDENT",
      #           "eventaction": "UPDATE",
      #           "fields": {
      #             "userID": "33988216-0366-4dd7-8545-e917204cdf2e"
      #           }
      #         }
      #       }
      #     ],
      #     "page": "1",
      #     "total": "3"
      #   }
      #
      # Details
      #
      # @param id [Integer] the Student ID
      #

      def events id
        response = @client.get( "#{ api_model.api_path }/#{ id }/events" )
        Edelements::Event.parse(response.body)
      end

      #def add_properties id, property
        #response = @client.put( "#{ api_model.api_path }/#{ id }/properties/#{ property }" )
        #api_model.parse(response.body)
      #end
    end
  end
end
