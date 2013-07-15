class Location < ActiveRecord::Base
  belongs_to :company
  has_many :rooms
  attr_accessible :address
end
