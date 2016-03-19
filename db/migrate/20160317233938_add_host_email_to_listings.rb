class AddHostEmailToListings < ActiveRecord::Migration
  def change
    add_column :listings, :host_email, :string
  end
end
