class Prefecture < ActiveRecord::Base
  has_many :major_cities, ->{ order(:id) }
  has_many :areas, ->{ order(:id) }
end
