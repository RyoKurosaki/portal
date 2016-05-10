class Prefecture < ActiveRecord::Base
  has_many :major_cities, ->{ order(:id) }
end
