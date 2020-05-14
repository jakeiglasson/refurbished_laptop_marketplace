class Laptop < ApplicationRecord
  enum sold_status: {false: 0, true: 1}, _prefix: :sold_status

  belongs_to :user

  has_one :laptop_order
  has_one :laptop_brand
  has_one :grade
  has_one :cpu
  has_one :ram
  has_one :hard_drive

  def brand_with_model
    "#{:brand_id} #{:model}"
  end

end
