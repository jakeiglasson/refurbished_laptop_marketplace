class Laptop < ApplicationRecord
  enum sold_status: {false: 0, true: 1}, _prefix: :sold_status

  belongs_to :user

  has_one :laptop_order, :foreign_key => :laptop_id
  has_one :laptop_brand, :foreign_key => :id
  has_one :grade, :foreign_key => :id
  has_one :cpu, :foreign_key => :id
  has_one :ram, :foreign_key => :id
  has_one :hard_drive, :foreign_key => :id
  
  has_one_attached :picture

  validates :user_id, :brand_id, :grade_id, :cpu_id, :ram_id, :hard_drive_id, :model, :price, presence: true
end
