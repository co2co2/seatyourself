class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def timeslots
    restaurant = self
    timeslot = []
    openhour = restaurant.open_hour
    until openhour >= restaurant.close_hour
      timeslot << openhour
      openhour += 30.minutes
    end
    return timeslot
  end

end
