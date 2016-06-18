class AddNoteExpectedTimeToApplyService < ActiveRecord::Migration
  def change
    add_column :apply_services, :note, :text
    add_column :apply_services, :expected_time, :time
  end
end
