require 'json'
require 'hashie/rash'
require 'httparty'

require 'edelements/configuration'
require 'edelements/version'
require 'edelements/api/client'
require 'edelements/errors'

# Data Models
require 'edelements/model'
require 'edelements/organization'
require 'edelements/school'
require 'edelements/teacher'
require 'edelements/student'
require 'edelements/course'
require 'edelements/event'
require 'edelements/webhook'

#API Operations
require 'edelements/api/resource'
require 'edelements/api/courses'
require 'edelements/api/events'
require 'edelements/api/organizations'
require 'edelements/api/schools'
require 'edelements/api/students'
require 'edelements/api/teachers'
require 'edelements/api/endpoints'

module Edelements
  extend Configuration
  extend Api::Endpoints
end
