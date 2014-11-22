class Store < ActiveRecord::Base

  validates_presence_of :name, :address

end
