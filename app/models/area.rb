class Area < ActiveRecord::Base
  belongs_to :prefecture
  has_many :restaurants, ->{ order(:id) }
end
