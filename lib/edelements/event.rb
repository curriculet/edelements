module Edelements
  class Event < Hashie::Mash
    include Edelements::Model

    api_path '/events'
  end
end
