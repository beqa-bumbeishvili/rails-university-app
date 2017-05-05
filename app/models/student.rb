class Student < ApplicationRecord
  belongs_to :school

  validates :name, presence: true


  validates :name, format: { with: /[A-Z][a-z0-9_-]/,
                             message: "First should be uppercase" }

  validates :last_name, format: { with: /[A-Z][a-z0-9_-]/,
                             message: "First should be uppercase" }

  validates :last_name, :presence => true, :if => :school_presence?

  def school_presence?
    return self.school.present?
  end

  def condition_testing?
    !(one == 0 && two == 1)
  end

end
