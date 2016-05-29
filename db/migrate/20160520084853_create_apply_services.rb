class CreateApplyServices < ActiveRecord::Migration
  def change
    create_table :apply_services do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :activity_service_id
      t.date :expected_date

      t.timestamps null: false
    end
  end
end
