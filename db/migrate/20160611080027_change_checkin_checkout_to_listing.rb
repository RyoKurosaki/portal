class ChangeCheckinCheckoutToListing < ActiveRecord::Migration
  def up
    change_column :listings, :checkin, :string
    change_column :listings, :checkout, :string
  end

  def down
    change_column :listings, :checkin, :time
    change_column :listings, :checkout, :time
  end
end
