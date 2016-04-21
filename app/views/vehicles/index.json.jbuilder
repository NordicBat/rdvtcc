json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :brand, :model, :year, :licencePlate, :odometerActual
  json.url vehicle_url(vehicle, format: :json)
end
