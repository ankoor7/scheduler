class Person < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :phone, :surname, :role
end
