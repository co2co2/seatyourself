class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, :party_size, presence: true
  validates :party_size, numericality: {message: "%{value} has to be a number!"}, unless: :restaurant_at_capacity?
end

private
  def restaurant_at_capacity?
    if self.party_size > self.restaurant.capacity
    end
  end
