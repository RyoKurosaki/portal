class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :plan

      t.timestamps null: false
    end
  end
end
