json.array!(@product_details) do |product_detail|
  json.extract! product_detail, :id, :product_id, :image_url, :long_description, :manufacturer, :country_of_origin, :volume_in_liter, :alcohol_by_volume, :calories_in_kcal_per_100ml, :grape_type
  json.url product_detail_url(product_detail, format: :json)
end
