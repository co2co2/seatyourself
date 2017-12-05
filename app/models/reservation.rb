class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, :party_size, presence: true
  validates :party_size, numericality: {only_integer: true}

  validate :time_cannot_be_earlier_than_now
  validate :restaurant_at_capacity
  validate :within_open_hours



  def time_cannot_be_earlier_than_now
    if self.time_slot > Time.now
      return true
    else
      errors.add(:time_slot, "You cannot go back in time. ")
    end
  end

  def within_open_hours
    if (self.time_slot > self.restaurant.open_hour) && (self.time_slot < self.restaurant.close_hour)
      return true
    else
      errors.add(:time_slot,"Sorry,the restaurant isn't open at that time.")
    end
  end

  def seat_left
    seat_available = self.restaurant.capacity
    upper = self.time_slot + 120.minutes
    lower = self.time_slot - 120.minutes

    current_reservations = Reservation.where( "time_slot > ? & time_slot < ? ",lower , upper )


    current_reservations.each do |r|
      seat_available -= r.party_size
    end
    return seat_available
  end

  def restaurant_at_capacity

    if self.party_size  <  self.seat_left
      return true
    else
      errors.add(:party_size, "The restaurant is full at that timeslot.")
    end
  end

end
