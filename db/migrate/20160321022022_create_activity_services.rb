class CreateActivityServices < ActiveRecord::Migration
  def change
    create_table :activity_services do |t|
      t.string :plan
      t.string :category
      t.string :photo
      t.string :amount

      t.timestamps null: false
    end
  end
end
