class LaptopOrder < ApplicationRecord
  belongs_to :user
  has_one :laptop, :foreign_key => :id

  validates :user_id, :laptop_id, presence: true
end
