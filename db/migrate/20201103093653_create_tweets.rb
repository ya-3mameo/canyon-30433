class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title,          null: false
      t.text :concept,          null: false
      t.integer :price,         null: false
      t.integer :prefecture_id, null: false
      t.date :visit_day,        null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
