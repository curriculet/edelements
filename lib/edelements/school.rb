module Edelements
  class School < Hashie::Mash
    include Edelements::Model

    api_path '/schools'
  end
end
