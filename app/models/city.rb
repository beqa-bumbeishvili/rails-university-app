class City < ApplicationRecord
  belongs_to :country
  after_update :set_updated_code

  validates :name, presence: true, length: { minimum: 5 }

  validates :name, length: { minimum: 10 }, format: { with:/\A[a-zA-Z]+\z/, message: 'atze meti simbolo unda iyos uechveli!' }

  validates :code, numericality: true

  def set_updated_code
    self.update_attributes(code: 5)
  end
end
