class User < ApplicationRecord
  enum seller: {false: 0, true: 1, requested: 2}, _prefix: :seller
  enum admin: {false: 0, true: 1}, _prefix: :admin
end
