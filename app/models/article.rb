class Article < ActiveRecord::Base

  belongs_to :store

  validates_presence_of :name, :description, :price, :total_in_vault, :total_in_shelf, :store_id

end
