module Edelements
  module Model
    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

    module InstanceMethods
      def to_json(*args)
        as_json(*args).to_json(*args)
      end

      def as_json(args = {})
        self.to_hash.stringify_keys
      end

      def to_i; id; end

      def ==(other)
        id == other.id
      end

      def json_root
        self.class.json_root
      end
    end

    module ClassMethods
      # api_path
      # This sets the API path so the API collections can use them in an agnostic way
      # @param path [String] the api path for the current model with a leading slash
      # @return [void]
      def api_path(path = nil)
        @_api_path ||= path
      end


      # These are the 2 types of responses that we get from the API
      #
      # MultiRecord Response (i.e. organizations.list)
      #
      # Returns all organizations
      #
      # GET  /v1_0/organizations.json
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

      #  Single Record Response (i.e. organizations.show)
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

      # Parses a request.body response into a Edelements::Model objects
      def parse( raw_json )
        parsed_json = String === raw_json ? JSON.parse(raw_json) : json
        if parsed_json.has_key?('data')
          #this is a multi record and data should contain an array
          raise Edelements::CannotProcessResponse.new('[:data] is present in response but it does not contain an Array') unless parsed_json['data'].is_a? Array
          return parsed_json['data'].map {|array_element|  new( extract_record(array_element) )  }
        else
          return  new( parsed_json )
        end
      end

      def extract_record( parsed_record )
        #each record comes in a <record_name>:{package}
        raise Edelements::CannotProcessResponse.new("[#{record_name}] is NOT present in response") unless parsed_record.has_key?(record_name.to_s)
        parsed_record[record_name]
      end

      def record_name
        @record_name ||= self.name.split('::').last.downcase
      end
    end

  end
end
