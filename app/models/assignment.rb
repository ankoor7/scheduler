class Assignment < Material
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :desription, :due_date, :name


  # belongs_to :event
end
