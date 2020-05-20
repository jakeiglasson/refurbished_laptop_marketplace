class HardDrive < ApplicationRecord
  has_many :laptops

  validates :name, presence: true
end
