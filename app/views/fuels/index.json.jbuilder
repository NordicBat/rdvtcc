json.array!(@fuels) do |fuel|
  json.extract! fuel, :id, :travel_id, :date, :total
  json.url fuel_url(fuel, format: :json)
end
