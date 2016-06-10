class AddApplyServiceIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :apply_service_id, :string
  end
end
