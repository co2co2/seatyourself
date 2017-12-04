class User < ApplicationRecord

  validates :email, presence: true
  validates :email, :password, length: {minimum: 4}
  validates :email, uniqueness: true

  has_secure_password
  has_many :reservations
  has_many :restaurants, through: :reservations
end
