class AddMajorCityIdToActivityService < ActiveRecord::Migration
  def change
    add_column :activity_services, :major_city_id, :string
  end
end
