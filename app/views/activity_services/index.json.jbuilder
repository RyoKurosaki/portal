json.array!(@activity_services) do |activity_service|
  json.extract! activity_service, :id, :plan, :category, :photo, :amount
  json.url activity_service_url(activity_service, format: :json)
end
