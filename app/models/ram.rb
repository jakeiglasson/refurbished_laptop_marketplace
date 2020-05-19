class Ram < ApplicationRecord
  has_many :laptops, :foreign_key => :id
end
