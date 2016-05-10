class AddNameToActivityServices < ActiveRecord::Migration
  def change
    add_column :activity_services, :name, :string
  end
end
