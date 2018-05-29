json.extract! instrument, :id, :name, :description, :image_url, :created_at, :updated_at
json.url instrument_url(instrument, format: :json)
