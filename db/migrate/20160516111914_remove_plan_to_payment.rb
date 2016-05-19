class RemovePlanToPayment < ActiveRecord::Migration
  def change
    remove_column :payments, :plan, :string
  end
end
