class Event < ActiveRecord::Base
  include ActiveModel::Validations # Only inject validation features of models
  attr_accessible :date, :description, :name, :time_slot, :teacher, :people, :room_id
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :people
  has_one :assignment
  has_one :material
  belongs_to :room

  validates :name, :date, :time_slot, presence: true
  validates :name, length: { minimum: 2 }


  def add_student student
    raise ArgumentError if student.class != Person
    ensure_person_is_not_registered person
    people << student
  end

  def add_teacher person
    raise ArgumentError if person.class != Person
    ensure_person_is_not_registered person
    teacher= person.id
  end

  def ensure_person_is_not_registered person
    if  self.teacher == person.id
      message = "Person is already registered as the teacher"
      errors.add(:people, message)
    elsif  self.person_ids.include? person.id
      message = "Person is already registered as a student"
      errors.add(:people, message)
    end
  end

end
