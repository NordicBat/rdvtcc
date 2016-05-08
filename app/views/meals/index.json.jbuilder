json.array!(@meals) do |meal|
  json.extract! meal, :id, :travel_id, :date, :kind, :total
  json.url meal_url(meal, format: :json)
end
