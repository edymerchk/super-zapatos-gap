module API
  module Entities
    class Store < Grape::Entity
      expose :id, :address, :name
    end
  end
end