json.extract! airport, :id, :IATA, :ICAO, :created_at, :updated_at
json.url airport_url(airport, format: :json)
