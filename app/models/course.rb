class Course < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :description, :name
  has_and_belongs_to_many :events


end
