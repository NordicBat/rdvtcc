json.array!(@toll_booths) do |toll_booth|
  json.extract! toll_booth, :id, :travel_id, :date, :total
  json.url toll_booth_url(toll_booth, format: :json)
end
