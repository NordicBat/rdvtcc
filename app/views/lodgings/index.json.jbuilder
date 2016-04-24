json.array!(@lodgings) do |lodging|
  json.extract! lodging, :id, :travel_id, :date, :hotelName, :hotelPhone, :total
  json.url lodging_url(lodging, format: :json)
end
