class RemovePlanToActivityServices < ActiveRecord::Migration
  def change
    remove_column :activity_services, :plan, :string
  end
end
