module Edelements
  class Course < Hashie::Mash
    include Edelements::Model

    api_path '/courses'
  end
end
