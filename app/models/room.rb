class Room < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :address, :name, :size

  belongs_to :location
  has_many :events
end
