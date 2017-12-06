class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations


  def self.search(search)
    where("name LIKE ? OR address LIKE ? OR menu LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end




  def timeslots
    restaurant = self
    timeslot = []
    if restaurant.open_hour > restaurant.close_hour
      start_time = restaurant.open_hour - 1.day
    else
      start_time = restaurant.open_hour
    end
    until start_time >= restaurant.close_hour
      timeslot << start_time
      start_time += 30.minutes
    end
    return timeslot
  end

end
