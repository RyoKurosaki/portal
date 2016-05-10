class RemovePrefectureToActivityServices < ActiveRecord::Migration
  def change
    remove_column :activity_services, :prefecture, :string
  end
end
