class AddCategoryIdToActivityServices < ActiveRecord::Migration
  def change
    add_column :activity_services, :category_id, :string
  end
end
