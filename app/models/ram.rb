class Ram < ApplicationRecord
  has_many :laptops, :foreign_key => :id
  validates :name, presence: true
end
