json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :kicker, :user_id, :content, :published_at, :published
  json.url post_url(post, format: :json)
end
