class StudentGrade < ApplicationRecord
  belongs_to :student
  belongs_to :lecture

  validates :student_grade, numericality: { only_integer: true }
  validates :student_grade, presence: true
  validates :student_id, presence: true
  validates :lecture_id, presence: true
  validates :student_grade, :inclusion => 0..100

end


