json.array!(@rentals) do |rental|
  json.extract! rental, :id, :date, :type, :rentalDuration
  json.url rental_url(rental, format: :json)
end
