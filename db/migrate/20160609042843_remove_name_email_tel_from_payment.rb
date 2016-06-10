class RemoveNameEmailTelFromPayment < ActiveRecord::Migration
  def change
    remove_column :payments, :name, :string
    remove_column :payments, :email, :string
    remove_column :payments, :tel, :string
  end
end
