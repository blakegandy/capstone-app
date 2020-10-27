class RenameDatetoStartsAt < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :date, :starts_at
  end
end
