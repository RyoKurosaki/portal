class AddIndexApplyServiceIdToPayment < ActiveRecord::Migration
  def change
    add_index :payments, :apply_service_id, :unique => true
  end
end
