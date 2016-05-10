class AddPrefectureToActivityService < ActiveRecord::Migration
  def change
    add_column :activity_services, :prefecture, :string
  end
end
