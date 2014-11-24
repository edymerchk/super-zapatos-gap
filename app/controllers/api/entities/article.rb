module API
  module Entities
    class Article < Grape::Entity
      expose :id, :description, :name, :price, :total_in_shelf, :total_in_vault
      expose :store_name do |article|
        article.store.name
      end
    end
  end
end