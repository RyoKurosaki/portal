class AddPrefectureIdToMajorCities < ActiveRecord::Migration
  def change
    add_column :major_cities, :prefecture_id, :string
  end
end
