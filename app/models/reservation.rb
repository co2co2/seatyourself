class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, presence: true
  validates :time_slot, presence: true
  validates :party_size, presence: true
  validates :party_size, numericality: {only_integer: true}

  # validate :time_cannot_be_earlier_than_now
  validate :restaurant_at_capacity
  validate :within_open_hours


  def time_cannot_be_earlier_than_now
    return unless time_slot
    if self.time_slot > Time.now
      return true
    else
      errors.add("You cannot go back in time. ")
    end
  end

  def within_open_hours
    return unless time_slot
    if self.time_slot > Time.now
      return true
    else
      errors.add("You cannot go back in time. ")
    end

    if (self.time_slot.in_time_zone('EST').strftime("%H%M").to_i > self.restaurant.open_hour.in_time_zone('EST').strftime("%H%M").to_i) && (self.time_slot.in_time_zone('EST').strftime("%H%M").to_i < self.restaurant.close_hour.in_time_zone('EST').strftime("%H%M").to_i)
      return true
    else
      errors.add("Sorry, the restaurant isn't open at that time.")
    end
  end

  def restaurant_at_capacity
    return unless party_size && time_slot
    #seat left
    seat_available = self.restaurant.capacity
    upper = self.time_slot + 120.minutes
    lower = self.time_slot - 120.minutes
    current_reservations = self.restaurant.reservations.where( "time_slot > ? And time_slot < ? ",lower , upper )
    current_reservations.each do |r|
      seat_available -= r.party_size
    end
    return seat_available
    #restaurant at capacity
    if self.party_size  <  self.seat_left
      return true
    else
      errors.add(:party_size, "The restaurant is full at that timeslot.")
    end
  end

end
