class ListingDetail < ActiveRecord::Base
  belongs_to :listing

  # def listing_details
  #   parse_listing_detail = JSON.parse(listing_detail)
  #   return [] unless parse_listing_detail.is_a?(Array) && parse_listing_detail.all? { |prop| prop.is_a?(Hash) }
  #   parse_listing_detail
  # rescue
  #   []
  # end
end
