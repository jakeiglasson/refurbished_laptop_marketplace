class Grade < ApplicationRecord
  has_many :laptops
  # has_many :laptops, :foreign_key => :id

  validates :name, presence: true
end
