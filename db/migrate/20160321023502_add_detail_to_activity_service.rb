class AddDetailToActivityService < ActiveRecord::Migration
  def change
    add_column :activity_services, :detail, :text
  end
end
