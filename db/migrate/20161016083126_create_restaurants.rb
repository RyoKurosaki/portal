class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :japanese_name
      t.string :cuisines
      t.text :detail
      t.string :tel
      t.text :tel_note
      t.string :address
      t.string :access
      t.text :hours
      t.string :close
      t.string :average_price
      t.string :cards_accepted
      t.string :smoking
      t.string :kid_friendly

      t.timestamps null: false
    end
  end
end
