class AddIntroduceAreaToArea < ActiveRecord::Migration
  def change
    add_column :areas, :introduce_area, :text
  end
end
