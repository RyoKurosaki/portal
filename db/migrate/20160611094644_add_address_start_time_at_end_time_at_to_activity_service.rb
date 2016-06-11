class AddAddressStartTimeAtEndTimeAtToActivityService < ActiveRecord::Migration
  def change
    add_column :activity_services, :address, :string
    add_column :activity_services, :start_time_at, :time
    add_column :activity_services, :end_time_at, :time
  end
end
