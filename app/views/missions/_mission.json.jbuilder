json.extract! mission, :id, :start_date, :end_date, :details, :status, :commander_id, :location_id, :created_at, :updated_at
json.url mission_url(mission, format: :json)
