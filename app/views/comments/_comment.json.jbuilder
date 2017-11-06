@post.comments do |comment| 
  json.extract! :id, :content, :created_at
end