# This is only convenience model to be used
# as part of the Edelements::Event API
module Edelements
  class Webhook < Hashie::Mash
    include Edelements::Model
    api_path 'events/webhooks'

    # Sets the mixed-in instance variable from Edelements::Model.
    # This api endpoint breaks convention and the and there is no
    # recordname for webhooks so we set it to blank
    @record_name = ''

  end
end
