json.array!(@cities) do |city|
  json.extract! city, :id, :State_id, :name
  json.url city_url(city, format: :json)
end
