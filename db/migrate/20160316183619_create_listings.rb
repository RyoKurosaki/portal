class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.string :manual
      t.string :map

      t.timestamps null: false
    end
  end
end
