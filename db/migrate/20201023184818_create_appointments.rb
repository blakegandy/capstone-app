class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :stylist_id
      t.integer :client_id
      t.date :date
      t.time :time
      t.text :details

      t.timestamps
    end
  end
end
