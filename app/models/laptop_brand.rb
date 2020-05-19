class LaptopBrand < ApplicationRecord
  has_many :laptops, :foreign_key => :brand_id

  has_one_attached :picture

  validates :picture, :name, presence: true
end
