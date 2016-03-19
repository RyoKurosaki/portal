class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.string :manual
      t.string :map
      t.string :access_token, :null => false, :limit => 12

      t.timestamps null: false
    end
    add_index :listings, :access_token, :unique => true
  end
end
