class CreateAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accesses do |t|
      t.string :postal_number
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :house_number
      t.string :building
      t.string :phone_number
      t.text :access_plan,      null: false
      t.references :tweet,      foreign_key: true
      t.timestamps
    end
  end
end
