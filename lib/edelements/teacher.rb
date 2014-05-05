module Edelements
  class Organization < Hashie::Mash
    include Edelements::Model

    api_path '/organizations'
  end
end
