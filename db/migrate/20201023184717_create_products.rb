class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
