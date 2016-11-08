class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :detail
      t.string :address
      t.string :tel
      t.string :area_id

      t.timestamps null: false
    end
  end
end
