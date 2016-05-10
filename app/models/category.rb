class Category < ActiveRecord::Base
  has_many :activity_services, ->{ order(:id) }
end
