module Edelements
  module Api
    class Events < Resource
      api_model Edelements::Event

      # show
      #
      # Returns specific event
      #
      # GET  /v1_0/events/{id}.json
      #
      #   {
      #     "id": "9bf62bfb-bc81-43e7-826b-9135ae1a2907",
      #     "schoolID": "abc-def-ghi",
      #     "timestamp": 1368569586000,
      #     "eventtype": "COURSE",
      #     "eventaction": "UPDATE",
      #     "fields": {
      #       "courseID": "1111-2222-3333"
      #     }
      #   }
      #
      # Details
      #
      # @param id [Integer] the Event ID
      #

      def show id
        response = @client.get( "#{ api_model.api_path }/#{ id }" )
        api_model.parse(response.body)
      end

      # eventtypes
      #
      # Returns all eventtypes
      #
      # GET  /v1_0/events/eventtypes.json
      #
      #   {
      #     "eventtype": [
      #       "COURSE",
      #       "STUDENT",
      #       "TEACHER",
      #       "COURSE ENROLLMENT"
      #     ]
      #   }
      #
      # Details
      #

      def eventtypes
        response = @client.get( "#{ api_model.api_path }/eventtypes" )
        api_model.parse(response.body)
      end

      # webhooks
      #
      # Returns all registered webhooks.  If the webhook is registered for all eventtypes, the eventtype field
      # will be omitted.
      #
      # GET  /v1_0/events/webhooks.json
      #
      #   {
      #     "data": [
      #       {
      #         "id": "9bf62bfb-bc81-43e7-826b-9135ae1a2907",
      #         "endpoint": "https://api.endpoint.com/enrollmentEvents",
      #         "eventtype": "COURSE ENROLLMENT",
      #         "token": String,
      #         "schoolID": "abc-def-ghi"
      #       },
      #       ...
      #     ],
      #     "page": "1",
      #     "total":
      #   }
      #
      # Details
      #

      def webhooks
        response = @client.get( "#{ api_model.api_path }/webhooks" )
        api_model.parse(response.body)
      end
    end
  end
end
