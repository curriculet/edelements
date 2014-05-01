require 'json'
require 'hashie/rash'
require 'httparty'

require 'edelements/configuration'
require 'edelements/version'
require 'edelements/api/client'
require 'edelements/errors'

#Api operations
require 'edelements/api/courses'
require 'edelements/api/events'
require 'edelements/api/history'
require 'edelements/api/organizations'
require 'edelements/api/schools'
require 'edelements/api/students'
require 'edelements/api/teachers'

module Edelements
  extend Configuration
end
