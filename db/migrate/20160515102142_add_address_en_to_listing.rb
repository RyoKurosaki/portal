class AddAddressEnToListing < ActiveRecord::Migration
  def change
    add_column :listings, :address_en, :string
  end
end
