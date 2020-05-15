class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum seller: {false: 0, true: 1, requested: 2}, _prefix: :seller
  enum admin: {false: 0, true: 1}, _prefix: :admin

  has_many :laptops, dependent: :destroy
  has_many :laptop_orders


end
