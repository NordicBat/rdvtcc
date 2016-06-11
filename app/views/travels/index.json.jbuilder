json.array!(@travels) do |travel|
  json.extract! travel, :id, :city_id, :initialDate, :finalDate, :description, :vehicle_id, :meal_id, :fuel_id, :lodging_id, :tollBooth_id, :user
  json.url travel_url(travel, format: :json)
end
