class AddAreaIdToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :area_id, :string
  end
end
