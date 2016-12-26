class CreateListingDetails < ActiveRecord::Migration
  def change
    create_table :listing_details do |t|
      t.integer :listing_id
      t.string :name
      t.string :photo_url
      t.text :detail

      t.timestamps null: false
    end
  end
end
