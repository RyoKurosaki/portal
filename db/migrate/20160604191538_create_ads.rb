class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
