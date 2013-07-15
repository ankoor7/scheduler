class Assignment <  ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :event_id, :file, :description, :due_date, :name


  has_one :event
end
