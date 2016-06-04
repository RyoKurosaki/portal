class AddAcceptToApplyService < ActiveRecord::Migration
  def change
    add_column :apply_services, :accept, :boolean, default: false
  end
end
