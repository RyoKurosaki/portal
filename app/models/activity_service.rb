class ActivityService < ActiveRecord::Base
  belongs_to :prefecture
  belongs_to :major_city
  belongs_to :category

  validates :name, presence: true
  validates :prefecture, presence: true
  validates :major_city, presence: true
  validates :category, presence: true
  validates :detail, presence: true
  validates :amount, numericality: { only_integer: true }, allow_blank: true
end
