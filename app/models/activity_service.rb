class ActivityService < ActiveRecord::Base
  belongs_to :prefecture
  belongs_to :major_city
  belongs_to :category
end
