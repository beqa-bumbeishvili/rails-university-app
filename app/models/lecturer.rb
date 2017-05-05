class Lecturer < ApplicationRecord
  belongs_to :school

  has_many :lectures, as: :teacher


end
