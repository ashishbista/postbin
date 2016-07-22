json.extract! post, :id, :header, :body, :created_at, :updated_at
json.url post_url(post, format: :json)