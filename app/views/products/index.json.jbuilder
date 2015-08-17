json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :description, :picture, :status, :register_date
  json.url product_url(product, format: :json)
end
