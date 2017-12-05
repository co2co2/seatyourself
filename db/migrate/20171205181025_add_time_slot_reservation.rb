class AddTimeSlotReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :time_slot, :time
  end
end
