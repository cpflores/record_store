json.array!(@records) do |record|
  json.extract! record, :id, :name, :artist, :year, :description, :price, :availability
  json.url record_url(record, format: :json)
end
