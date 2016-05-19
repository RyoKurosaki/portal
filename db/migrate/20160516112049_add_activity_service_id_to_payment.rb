class AddActivityServiceIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :activity_service_id, :string
  end
end
