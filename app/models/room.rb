class Room < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :address, :name, :size
end
