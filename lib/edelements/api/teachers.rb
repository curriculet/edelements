module Edelements
  module Api
    class Teachers < Resource
      api_model Edelements::Teacher

      # show
      #
      # Returns specific teacher
      #
      # GET  /v1_0/teachers/{id}.json
      #
      #   {
      #     "schoolID": "abc-def-ghi",
      #     "id": "AEC-JIKD-QIWEU",
      #     "firstName": "First",
      #     "lastName": "Last",
      #     "middleName": "Middle",
      #     "email": "email@email.eml",
      #     "number": "12345",
      #     "courseEnrollments": [
      #       {
      #         "enrollment": {
      #           "startDate": 1353484800000,
      #           "courseID": "asdf",
      #           "lastUpdate": ,
      #           "role": "Primary",
      #           "endDate": 1353484800000
      #         }
      #       }
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
      # @param id [Integer] the Teacher ID
      #

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      # students
      #
      # Returns all students of a specific teacher
      #
      # GET  /v1_0/teachers/{id}/students.json
      #
      #   {
      #     "data": [
      #       {
      #         "student": {
      #           "schoolID": "abc-def-ghi",
      #           "id": "123-456-789",
      #           "firstName": "First",
      #           "lastName": "Last",
      #           "middleName": "Middle",
      #           "email": "email@email.eml",
      #           "number": "12345",
      #           "courseEnrollments": [
      #             {
      #               "enrollment": {
      #                 "startDate": 1361779200000,
      #                 "courseID": "asdf",
      #                 "lastUpdate": ,
      #                 "role": "student",
      #                 "endDate":
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
      #       }
      #     ],
      #     "page": ,
      #     "total":
      #   }
      #
      # Details
      #
      # @param id [Integer] the Teacher ID
      #

      def students id
        response = @client.get( "#{ api_model.api_path }/#{ id }/students" )
        api_model.parse(response.body)
      end

      # courses
      #
      # Returns all courses of a specific teacher
      #
      # GET  /v1_0/teachers/{id}/courses.json
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
      # @param id [Integer] the Teacher ID
      #

      def courses id
        response = @client.get( "#{ api_model.api_path }/#{ id }/courses" )
        api_model.parse(response.body)
      end

      # events
      #
      # Returns all events of a specific teacher
      #
      # GET  /v1_0/teachers/{teacherID}/events.json
      #
      #   {
      #     "data": [
      #       {
      #         "events": {
      #           "id": "d7743718-f161-4ad9-9a99-bb1bb065b5b2",
      #           "schoolID": "abc-def-ghi",
      #           "timestamp": 1369184979000,
      #           "eventtype": "TEACHER",
      #           "eventaction": "UPDATE",
      #           "fields": {
      #             "userID": "dfb0dcbd-6499-478d-b139-6868bc124740"
      #           }
      #         }
      #       },
      #       {
      #         "events": {
      #           "id": "901e17e4-e9ed-420b-832f-565b75ff3d94",
      #           "schoolID": "abc-def-ghi",
      #           "timestamp": 1369184927000,
      #           "eventtype": "TEACHER",
      #           "eventaction": "CREATE",
      #           "fields": {
      #             "userID": "dfb0dcbd-6499-478d-b139-6868bc124740"
      #           }
      #         }
      #       }
      #     ],
      #     "page": "1",
      #     "total": "2"
      #   }
      #
      # Details
      #
      # @param id [Integer] the Teacher ID
      #

      def events id
        response = @client.get( "#{ api_model.api_path }/#{ id }/events" )
        api_model.parse(response.body)
      end

      #def add_properties id, property
        #response = @client.put( "#{ api_model.api_path }/#{ id }/properties/#{ property }" )
        #api_model.parse(response.body)
      #end
    end
  end
end
