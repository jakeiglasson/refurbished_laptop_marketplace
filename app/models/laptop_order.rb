class LaptopOrder < ApplicationRecord
  belongs_to :user
  has_one :laptop
end
