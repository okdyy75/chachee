json.extract! message, :id, :ssid, :msg, :created_at, :updated_at
json.url message_url(message, format: :json)
