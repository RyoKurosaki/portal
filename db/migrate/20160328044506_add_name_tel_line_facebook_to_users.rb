class AddNameTelLineFacebookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :tel, :string
    add_column :users, :line, :string
    add_column :users, :facebook, :string
  end
end
