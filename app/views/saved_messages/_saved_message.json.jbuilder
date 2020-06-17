json.extract! saved_message, :id, :title, :body, :created_at, :updated_at
json.url saved_message_url(saved_message, format: :json)
