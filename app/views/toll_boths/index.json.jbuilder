json.array!(@toll_boths) do |toll_both|
  json.extract! toll_both, :id, :travel_id, :date, :total
  json.url toll_both_url(toll_both, format: :json)
end
