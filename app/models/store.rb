class Store < ActiveRecord::Base

  has_many :articles, dependent: :destroy

  validates_presence_of :name, :address

end
