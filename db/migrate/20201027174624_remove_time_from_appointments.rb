class RemoveTimeFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :time, :time
  end
end
