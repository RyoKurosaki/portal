class RemoveCategoryToActivityServices < ActiveRecord::Migration
  def change
    remove_column :activity_services, :category, :string
  end
end
