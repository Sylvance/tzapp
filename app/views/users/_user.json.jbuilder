json.extract! user, :id, :name, :bio, :balance, :created_at, :updated_at
json.url user_url(user, format: :json)
