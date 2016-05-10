class AddPrefectureIdToActivityServices < ActiveRecord::Migration
  def change
    add_column :activity_services, :prefecture_id, :string
  end
end
