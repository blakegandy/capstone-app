class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.boolean :stylist
      t.string :salon
      t.string :image_url
      t.string :specialty

      t.timestamps
    end
  end
end
