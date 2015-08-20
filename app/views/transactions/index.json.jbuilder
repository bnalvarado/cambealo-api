json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :product_offered_id, :product_req_id, :date, :state
  json.url transaction_url(transaction, format: :json)
end
