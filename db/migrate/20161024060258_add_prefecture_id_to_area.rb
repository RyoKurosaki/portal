class AddPrefectureIdToArea < ActiveRecord::Migration
  def change
    add_column :areas, :prefecture_id, :string
  end
end
