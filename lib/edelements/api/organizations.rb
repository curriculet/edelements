module Edelements
  module Api
    class Organizations < Resource
      api_model Edelements::Organization

      # list
      #
      # Returns all organizations
      #
      # GET  /v1_0/organizations.json
      #
      # Example Response
      #
      #   {
      #     "data":
      #       [
      #         {
      #           "organization": {
      #             "id": guid field,
      #             "parentID”: parentID field,
      #             "name": nameField,
      #             "typeField": typeFIeld
      #           }
      #         }
      #       ],
      #       "page": ,
      #       "total":
      #   }
      #

      def list
        response = @client.get( api_model.api_path )
        api_model.parse(response.body)
      end

      # show
      #
      # Returns specific organization
      #
      # GET  /v1_0/organizations/{id}.json
      #
      #   {
      #     "organization":
      #       {
      #         "id": guid field,
      #         "parentID": parentID field,
      #         "name": nameField,
      #         "typeField": typeFIeld
      #       }
      #   }
      #
      # Details
      #
      # @param id [Integer] the Organization ID
      #

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      # organizations
      #
      # Returns all organizations within a specific organization
      #
      # GET  /v1_0/organizations/{id}/organizations.json
      #
      #  {
      #    "data": [
      #      {
      #        "organization": {
      #          "id": guid field,
      #          "parentID": parentID field,
      #          "name": nameField,
      #          "typeField": typeFIeld
      #        }
      #      },
      #    ...],
      #    "page": ,
      #    "total":
      #  }
      #
      #
      # Details
      #
      # @param id [Integer] the Organization ID
      #

      def organizations id
        response = @client.get( "#{ api_model.api_path }/#{ id }/organizations" )
        api_model.parse(response.body)
      end

      # schools
      #
      # Returns all schools within a specific organization
      #
      # GET  /v1_0/organizations/{id}/schools.json
      #
      #  {
      #    "data": [
      #      {
      #        "school": {
      #          organizationID: asdf,
      #          "id": "abc-def-ghi",
      #          ,
      #          name: asdf,
      #          address: {
      #            street1: asdf,
      #            street2: asdf,
      #            city: asdf,
      #            state: as,
      #            zip: asdf
      #          },
      #          properties: {
      #            "ncesID": "",
      #            remoteID: asdf
      #          },
      #          lastUpdate: asdf
      #        }
      #      },
      #      ...
      #    ],
      #    "page": ,
      #    "total":
      #  }
      #
      # Details
      #
      # @param id [Integer] the Organization ID
      #

      def schools id
        response = @client.get( "#{ api_model.api_path }/#{ id }/schools" )
        Edelements::School.parse( response.body )
      end

      # teachers
      #
      # Returns all teachers within a specific organization
      #
      # GET  /v1_0/organizations/{id}/teachers.json
      #
      #  {
      #    "data": [
      #      {
      #        "teacher": {
      #          "schoolID": "abc-def-ghi",
      #          "id": "AEC-JIKD-QIWEU",
      #          "firstName": "First",
      #          "lastName": "Last",
      #          "middleName": "Middle",
      #          "email": "email@email.eml",
      #          "number": "12345",
      #          "courseEnrollments": [
      #            {
      #              "enrollment": {
      #                {
      #                  "data": [
      #                    {
      #                      "teacher": {
      #                        "schoolID": "abc-def-ghi",
      #                        "id": "AEC-JIKD-QIWEU",
      #                        "firstName": "First",
      #                        "lastName": "Last",
      #                        "middleName": "Middle",
      #                        "email": "email@email.eml",
      #                        "number": "12345",
      #                        "courseEnrollments": [
      #                          {
      #                            "enrollment": {
      #                              "startDate": 1353484800000,
      #                              "courseID": "asdf",
      #                              "lastUpdate": ,
      #                              "role": "Primary",
      #                              "endDate": 1353484800000
      #                            }
      #                          }
      #                        ],
      #                        "address": {
      #                          "street1": "123 Street",
      #                          "street2": "#456",
      #                          "city": "City",
      #                          "state": "CA",
      #                          "zip": "12345"
      #                        },
      #                        "properties": {
      #                          "remoteID": "qwerty",
      #                          "login": "userLogin",
      #                          "password": <...encrypted...>
      #                        },
      #                        "lastUpdate":
      #                      }
      #                    },
      #                    ...
      #                  ],
      #                  "page": ,
      #                  "total":
      #                }
      #
      # Details
      #
      # @param id [Integer] the Organization ID
      #

      def teachers id
        response = @client.get( "#{ api_model.api_path }/#{ id }/teachers" )
        Edelements::Teacher.parse(response.body)
      end

      # students
      #
      # Returns all organizations within a specific organization
      #
      # GET  /v1_0/organizations/{id}/students.json
      #
      #  {
      #    "data": [
      #      {
      #        "student": {
      #          "schoolID": "abc-def-ghi",
      #          "id": "123-456-789",
      #          "firstName": "First",
      #          "lastName": "Last",
      #          "middleName": "Middle",
      #          "email": "email@email.eml",
      #          "number": "12345",
      #          "courseEnrollments": [
      #            {
      #              "enrollment": {
      #                "startDate": 1361779200000,
      #                "courseID": "asdf",
      #                "lastUpdate": ,
      #                "role": "student",
      #                "endDate":
      #              }
      #            }
      #          ],
      #          "address": {
      #            "street1": "123 Street",
      #            "street2": "#456",
      #            "city": "City",
      #            "state": "CA",
      #            "zip": "12345"
      #          },
      #          "properties": {
      #            "remoteID": "qwerty",
      #            "login": "userLogin",
      #            "password": <...encrypted...>
      #          },
      #          "lastUpdate":
      #        }
      #      }
      #    ],
      #    "page": ,
      #    "total":
      #  }
      #
      # Details
      #
      # @param id [Integer] the Organization ID
      #

      def students id
        response = @client.get( "#{ api_model.api_path }/#{ id }/students" )
        Edelements::Student.parse(response.body)
      end

      # courses
      #
      # Returns all courses within a specific organizations
      #
      # GET  /v1_0/organizations/{id}/courses.json
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
      # @param id [Integer] the Organization ID
      #

      def courses id
        response = @client.get( "#{ api_model.api_path }/#{ id }/courses" )
        Edelements::Course.parse(response.body)
      end

      # events
      #
      # Returns all events within a specific organization
      #
      # GET  /v1_0/organizations/{id}/events.json
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
      #     ],
      #     "page": "1",
      #     "total": "6"
      #  }      #
      # Details
      #
      # @param id [Integer] the Organization ID
      #

      def events id
        response = @client.get( "#{ api_model.api_path }/#{ id }/events" )
        Edelements::Event.parse(response.body)
      end
    end
  end
end
