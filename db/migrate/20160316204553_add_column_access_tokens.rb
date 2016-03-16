class AddColumnAccessTokens < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :access_token, :null => false, :limit => 12
      t.timestamps
    end
    add_index :listings, :access_token, :unique => true
  end
end
