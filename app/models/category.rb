class Category < ActiveRecord::Base
  has_many :activity_services, ->{ order(:id) }

  validates :name, presence: true
  validates :detail, presence: true
end
