class CreateEmergencyCalls < ActiveRecord::Migration
  def change
    create_table :emergency_calls do |t|
      t.string :name
      t.string :tel
      t.string :memo

      t.timestamps null: false
    end
  end
end
