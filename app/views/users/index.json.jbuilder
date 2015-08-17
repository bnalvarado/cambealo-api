json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :password, :email, :phone, :age, :token
  json.url user_url(user, format: :json)
end