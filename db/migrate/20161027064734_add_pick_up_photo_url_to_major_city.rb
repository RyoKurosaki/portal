class AddPickUpPhotoUrlToMajorCity < ActiveRecord::Migration
  def change
    add_column :major_cities, :pickup_photo_url, :string
    add_column :major_cities, :pickup_photo_primary, :integer
  end
end
