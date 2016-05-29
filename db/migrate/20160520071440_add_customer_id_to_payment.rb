class AddCustomerIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :customer_id, :string
  end
end
