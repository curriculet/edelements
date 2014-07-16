module Edelements
  module Api
    class Courses < Resource
      api_model Edelements::Course

      # show
      #
      # Returns specific course
      #
      # GET  /v1_0/courses/{id}.json
      #
      #   {
      #     "schoolID": "abc-def-ghi",
      #     "id": "d53bfbc4-fbbf-41e5-aa0a-55be36bad769",
      #     "name": "LAN1400 C",
      #     "schoolYear": "2012-2013",
      #     "startDate": "YYYY-MM-DD",
      #     "endDate": "YYYY-MM-DD",
      #     "properties": {
      #       "parentCourseID": "d53bfbc4-fbbf-41e5-aa0a-55be36bad760"
      #     },
      #     "teacherEnrollments": [
      #       {
      #         enrollment: {
      #           userID: guid,
      #           role: primary/secondary,
      #           startDate: ,
      #           endDate: ,
      #           lastUpdate:
      #         }
      #       },
      #       ...
      #     ],
      #     "studentEnrollments": [
      #       {
      #         enrollment: {
      #           userID: guid,
      #           role: student,
      #           startDate: ,
      #           endDate: ,
      #           lastUpdate:
      #         }
      #       },
      #       ...
      #     ]
      #   }
      #
      # Details
      #
      # @param id [Integer] the Course ID
      #

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      # teachers
      #
      # Returns all teachers within a specific course
      #
      # GET  /v1_0/courses/{id}/teachers.json
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
      # @param id [Integer] the Course ID
      #

      def teachers id
        response = @client.get( "#{ api_model.api_path }/#{ id }/teachers" )
        Edelements::Teacher.parse(response.body)
      end

      # students
      #
      # Returns all students within a specific course
      #
      # GET  /v1_0/courses/{id}/students.json
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
      # @param id [Integer] the Course ID
      #

      def students id
        response = @client.get( "#{ api_model.api_path }/#{ id }/students" )
        Edelements::Student.parse(response.body)
      end

      # events
      #
      # Returns all events within a specific course
      #
      # GET  /courses/{id}/events.json
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
      #             "userID": "61958ec0-3076-4de7-a5d3-11c07bf16f80",
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
      #             "userID": "da0dcfe9-724f-401c-a73c-ebbde0a8e2ea",
      #             "courseID": "49c2b0b2-c267-11e2-ae9e-f0def14820f1"
      #           }
      #         }
      #       },
      #       {
      #         "events": {
      #           "id": "1cc5d138-9dca-4f82-9a29-08b439635bfb",
      #           "schoolID": "abc-def-ghi",
      #           "timestamp": 1369184896000,
      #           "eventtype": "COURSE",
      #           "eventaction": "UPDATE",
      #           "fields": {
      #             "courseID": "49c2b0b2-c267-11e2-ae9e-f0def14820f1"
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
      # @param id [Integer] the Course ID
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
