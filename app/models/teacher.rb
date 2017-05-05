class Teacher < ApplicationRecord
  belongs_to :school
  has_many :lectures

  has_many :lectures, as: :teacher

end
