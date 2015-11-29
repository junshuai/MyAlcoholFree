json.array!(@customers) do |customer|
  json.extract! customer, :id, :user_id, :name, :address, :email
  json.url customer_url(customer, format: :json)
end
