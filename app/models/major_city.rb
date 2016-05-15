class MajorCity < ActiveRecord::Base
  belongs_to :prefecture

  validates :name, presence: true
  validates :prefecture, presence: true
end
