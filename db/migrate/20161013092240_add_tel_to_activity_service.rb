class AddTelToActivityService < ActiveRecord::Migration
  def change
    add_column :activity_services, :tel, :string
  end
end
