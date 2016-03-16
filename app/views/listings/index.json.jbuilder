json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :address, :photo, :manual, :map
  json.url listing_url(listing, format: :json)
end
