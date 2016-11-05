class AddAreaIdToMajorCity < ActiveRecord::Migration
  def change
    add_column :major_cities, :area_id, :string
  end
end
