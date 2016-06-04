class ChangeAcceptToApplyService < ActiveRecord::Migration
  def up
    change_column :apply_services, :accept, :boolean, default: nil
  end

  def down
    change_column :apply_services, :accept, :boolean, default: false
  end
end
