class Laptop < ApplicationRecord
  enum sold_status: {false: 0, true: 1}, _prefix: :sold_status
end
