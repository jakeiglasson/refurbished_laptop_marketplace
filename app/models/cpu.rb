class Cpu < ApplicationRecord
  has_many :laptops
  validates :name, presence: true
end
