class Calendar < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :date, :time_slot
end
