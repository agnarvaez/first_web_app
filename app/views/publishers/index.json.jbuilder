json.array!(@publishers) do |publisher|
  json.extract! publisher, :id, :title, :city, :state
  json.url publisher_url(publisher, format: :json)
end
