json.array!(@listings) do |listing|
  json.extract! listing, :access_token, :name, :address, :photo, :manual, :map
  json.url listing_url(listing, format: :json)
end
