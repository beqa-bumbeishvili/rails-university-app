class School < ApplicationRecord

  before_create :substitute_school_name

  validates :name, format: { with: /[A-Z][a-z0-9_-]/,
                             message: 'First should be uppercase' }

  validates :name, format: { with: /No|#/,
                             message: 'must contain \'No\' or \'#\'' }

  has_many :students
  has_many :lectures, through: :teachers
  #has_many :lectures, through: :lecturers
  has_many :teachers
  has_many :lecturers

  def substitute_school_name
    self.name = self.name.gsub('No','#')
  end
end