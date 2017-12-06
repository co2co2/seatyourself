class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations


  def self.search(search)
    where("name LIKE ? OR address LIKE ? ", "%#{search}%", "%#{search}%")
  end




  def timeslots
    restaurant = self
    timeslot = []
    if restaurant.open_hour > restaurant.close_hour
      openhour = restaurant.open_hour - 1.day
    else
      openhour = restaurant.open_hour
    end
    until openhour >= restaurant.close_hour
      timeslot << openhour
      openhour += 30.minutes
    end
    return timeslot
  end

end
