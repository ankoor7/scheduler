class Material < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :event_id, :file

  belongs_to :event
end
