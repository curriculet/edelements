require 'hashie/rash'

module Edelements
  module API
    class Client
      include HTTParty

      # initialize
      #
      # The Edelements Api Client can be configured via Edelements.configure block
      # or via a hash with the appropriate values set
      #
      # endpoint:     required. The API endpoing i.e https://appsapi.edmodo.com
      # api_version:  required. The API version (v1 or V1.1)
      # api_key:      required. Your edmodo api key
      # timeout:      optional. The HTTP timeout
      # testing:      optional. Set it to true to activate debugging output
      #
      # @param configuration [Edelements or Hash] A hash or Edelements::Configuration that contains the parameters to
      #     be used when issuing HTTP Calls
      def initialize( configuration )

        if configuration.is_a?(Module) && configuration.to_s == 'Edelements'
          config = configuration
        elsif configuration.is_a?(Hash)
          config = Hashie::Rash.new( configuration )
          config.api_url = [config.endpoint,config.api_version].join('/')
        end

        #if config.api_key
          #self.class.default_params({ 'api_key' => config.api_key})
        #else
          #raise Edelements::InvalidCredentials.new("Api Key is not present but it is required.")
        #end

        self.class.base_uri( config.api_url )                     if config.api_url
        self.class.default_timeout config.timeout.to_f            if config.timeout
        self.class.debug_output                                   if config.testing
        self.class.headers({'User-Agent' => config.user_agent})   if config.user_agent
      end

      # get
      # send an HTTPS Get request against Edelement's API.
      # Yields the get_options before sending making the request.
      #
      #
      # @param path    [String] The path for the api endpoint (with leading slash)
      # @param params  [Hash]   A hash of query arguments for the request (optional)
      # @param headers [Hash]   A hash of header fields (optional).
      #
      #
      # @return [String]. The raw response body (JSON is expected) Raises appropriate exception if it fails
      # @raise Edelements::HTTPError when any HTTP error response is received
      def get( path, params={}, headers={})
        get_options = build_get_options( params, headers)
        yield get_options if block_given?

        #puts "CALLING API: #{Edmodo.api_url( path )} ===#{get_options}"
        response = self.class.get( path, get_options.merge({ basic_auth: { username: '7ecb0c9c-cca6-11e3-97de-22000aa43193', password: ''} } ))

        case response.code
        when 200..201
          response
        when 400
          raise Edelements::BadRequest.new(response, params)
        when 401
          raise Edelements::AuthenticationFailed.new(response, params)
        when 404
          raise Edelements::NotFound.new(response, params)
        when 500
          raise Edelements::ServerError.new(response, params)
        when 502
          raise Edelements::Unavailable.new(response, params)
        when 503
          raise Edelements::RateLimited.new(response, params)
        else
          raise Edelements::UnknownStatusCode.new(response, params)
        end
      end

      # build_get_options
      # Build the hash of options for an HTTP get request.
      #
      # @param params  [Hash] optional. Any query parameters to add to the request.
      # @param user_headers [Hash] optional. Any query parameters to add to the request.
      #
      # @return [Hash] The properly formated get_options.
      def build_get_options( params={}, user_headers={})
        get_options = {}
        query = {}

        query.merge!(params)
        get_options[:query]   = query

        # pass any headers
        headers ={}
        headers.merge!( user_headers )
        get_options[:headers] = headers

        get_options
      end
    end
  end
end
