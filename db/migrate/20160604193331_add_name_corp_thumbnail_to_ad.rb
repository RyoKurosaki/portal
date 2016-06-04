class AddNameCorpThumbnailToAd < ActiveRecord::Migration
  def change
    add_column :ads, :name, :string
    add_column :ads, :corp, :string
    add_column :ads, :thumbnail, :string
  end
end
