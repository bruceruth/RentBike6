json.array!(@bikes) do |bike|
  json.extract! bike, :id, :name, :description, :image_url, :price, :category, :subcategory
  json.url bike_url(bike, format: :json)
end
