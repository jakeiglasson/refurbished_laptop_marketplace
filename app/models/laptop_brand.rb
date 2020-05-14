class LaptopBrand < ApplicationRecord
  has_many :laptops

  has_one_attached :picture

  validates :picture, :name, presence: true
end
