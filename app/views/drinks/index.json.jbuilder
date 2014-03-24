json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :cost, :location, :description, :references
  json.url drink_url(drink, format: :json)
end
