json.extract! flight, :id, :from_airport_id, :to_airport_id, :pilot_in_command_id, :co_pilot_id, :created_at, :updated_at
json.url flight_url(flight, format: :json)
