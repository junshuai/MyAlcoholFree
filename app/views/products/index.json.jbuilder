json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :thumbnail_url, :price
  json.url product_url(product, format: :json)
end
