module Edelements
  class Event < Hashie::Mash
    include Edelements::Model
    api_path '/events'

    # Sets the mixed-in instance variable from Edelements::Model.
    # This api point breaks convention and the record name instead of
    # being 'event' its 'events' this handles that specific
    # case
    @record_name = 'events'




  end
end
