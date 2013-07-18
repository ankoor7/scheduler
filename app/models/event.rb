class Event < ActiveRecord::Base
  attr_accessible :scheduled_date, :description, :name, :time_slot, :teacher, :people, :room_id
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :people
  has_one :assignment
  has_one :material
  belongs_to :room

  validates :name, :scheduled_date, :time_slot, presence: true
  validates :name, length: { minimum: 2 }


  def add_student student
    binding.pry
    raise ArgumentError if student.class != Person
    if ensure_person_is_not_registered student
      people << student
    end
  end

  def remove_student student
    raise ArgumentError if student.class != Person
    if person_ids.include? student.id
      people.delete(student)
    end
  end

  def add_teacher person
    raise ArgumentError if person.class != Person
    if ensure_person_is_not_registered person
      teacher= person.id
    end
  end

  def ensure_person_is_not_registered person
    if teacher == person.id
      message = "Person is already registered as the teacher"
      errors.add(:people, message)
      false
    elsif  self.person_ids.include? person.id
      message = "Person is already registered as a student"
      errors.add(:people, message)
      false
    else
      true
    end
  end

 def self.now
  Date.today
 end

  scope :thisweek, where(scheduled_date: Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1) )
  scope :thismonth, lambda { where(scheduled_date: Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+1.month) ) }
  scope :next3month, lambda { where(scheduled_date: Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+3.month) ) }


end
