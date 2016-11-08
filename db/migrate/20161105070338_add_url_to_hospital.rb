class AddUrlToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :url, :string
  end
end
