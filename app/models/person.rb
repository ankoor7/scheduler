class Person < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :phone, :surname, :role
  has_and_belongs_to_many :events

  validates :name, :surname, :role, presence: true
  validates :phone, :email, uniqueness: true
  validates :name, length: { minimum: 2 }

  def role? role
    self.role == role
  end



end
