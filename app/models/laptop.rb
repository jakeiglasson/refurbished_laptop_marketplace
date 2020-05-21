class Laptop < ApplicationRecord
  enum sold_status: { false: 0, true: 1 }, _prefix: :sold_status

  belongs_to :user

  has_one :laptop_order

  belongs_to :laptop_brand
  belongs_to :grade
  belongs_to :cpu
  belongs_to :ram
  belongs_to :hard_drive

  has_one_attached :picture

  validates :user_id, :laptop_brand_id, :grade_id, :cpu_id, :ram_id, :hard_drive_id, :model, :price, presence: true
end
