class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :time_slot
  has_and_belongs_to_many :courses
end
