class CreateMajorCities < ActiveRecord::Migration
  def change
    create_table :major_cities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
