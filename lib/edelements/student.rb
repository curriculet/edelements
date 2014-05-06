module Edelements
  class Student < Hashie::Mash
    include Edelements::Model

    api_path '/students'
  end
end
