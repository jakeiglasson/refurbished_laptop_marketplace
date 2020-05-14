class Laptop < ApplicationRecord
  enum sold_status: {false: 0, true: 1}, _prefix: :sold_status

  belongs_to :user

  has_one :laptop_order
  has_one :laptop_brand
  has_one :grade
  has_one :cpu
  has_one :ram
  has_one :hard_drive
  has_one_attached :picture

  validates :user_id, :brand_id, :grade_id, :cpu_id, :ram_id, :hard_drive_id, :model, :price, presence: true
end
