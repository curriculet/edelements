module Edelements
  class Teacher < Hashie::Mash
    include Edelements::Model

    api_path '/teachers'
  end
end
