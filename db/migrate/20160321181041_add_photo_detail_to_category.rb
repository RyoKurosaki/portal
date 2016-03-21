class AddPhotoDetailToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :photo, :string
    add_column :categories, :detail, :text
  end
end
