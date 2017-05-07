class Lecture < ApplicationRecord
  validates :name, :presence => {message: 'please fill'}

  validates :name, format: { with: /[A-Z][a-z0-9_-]/,
                             message: "First should be uppercase" }

  validates :passing_grade, numericality: { only_integer: true }

  belongs_to :owner_object, polymorphic: true

end
