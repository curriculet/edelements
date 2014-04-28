module Edelements
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :api_version, :user_agent, :testing, :timeout].freeze
    VALID_OPTIONS_KEYS    = [:api_key].freeze

    #@!visibility private
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_ENDPOINT      = 'http://johnson-test-1.edelements.com'
    DEFAULT_API_VERSION   = 'v1.0'
    DEFAULT_USER_AGENT    = 'Edelements API Ruby Gem by Curriculet'.freeze
    DEFAULT_TIMEOUT       = nil
    DEFAULT_TESTING       = false
    DEFAULT_API_KEY       = nil

    # Build accessor methods for every config options so we can do this, for example:
    attr_accessor *VALID_CONFIG_KEYS


    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset!
    end

    # reset!
    # set all options to their defaults and free the client
    def reset!
      self.endpoint     = DEFAULT_ENDPOINT
      self.api_version  = DEFAULT_API_VERSION
      self.user_agent   = DEFAULT_USER_AGENT
      self.timeout      = DEFAULT_TIMEOUT
      self.testing      = DEFAULT_TESTING

      self.api_key      = DEFAULT_API_KEY

      @client           = nil
    end

    #@return [Hash] of all options
    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    # api_url
    # Interpolate the base url for all calls
    # return [String] the base url for all api calls
    def api_url( path = nil)
      [endpoint,api_version,path].compact.join('/')
    end

    # Yields itself for use in the configuration block
    # @example
    #  Edelements.configure do |c|
    #    c.api_key    = <MY-API-KEY>
    #    c.api_verion = 'v1.0'
    #    c.endpoint   = 'http://johnson-test-1.edelements.com'
    #    c.timeout    = '10' #seconds
    #    c.testing    = true
    #  end
    #
    # @return Edelements::API::Client
    #
    def configure
      yield self
      @client = Edelements::API::Client.new( self )
    end

    protected

    def client
      @client ||= Edelements::API::Client.new( self )
    end

  end # Configuration
end
