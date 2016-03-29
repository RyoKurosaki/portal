class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
