class ChangeDatetoDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :appointments, :date, :datetime
  end
end
