json.array!(@travels) do |travel|
  json.extract! travel, :id, :city_id, :initialDate, :finalDate, :description, :vehicle_id, :meal_id, :fuel_id, :lodging_id, :tollBoth_id, :finalOdometer
  json.url travel_url(travel, format: :json)
end
