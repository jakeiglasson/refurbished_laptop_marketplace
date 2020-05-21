class LaptopOrder < ApplicationRecord
  belongs_to :user
  belongs_to :laptop

  validates :user_id, :laptop_id, presence: true
end
