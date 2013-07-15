class Company < ActiveRecord::Base
  attr_accessible :description, :email, :name

  has_many :locations
end
