class AddUrlToActivityService < ActiveRecord::Migration
  def change
    add_column :activity_services, :url, :string
  end
end
