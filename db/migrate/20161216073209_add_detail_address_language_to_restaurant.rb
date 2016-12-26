class AddDetailAddressLanguageToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :detail_address, :text
    add_column :restaurants, :language, :text
  end
end
