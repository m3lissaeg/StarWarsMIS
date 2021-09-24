json.extract! squad, :id, :name, :created_at, :updated_at
json.url mission_squad_url(@mission, squad, format: :json)
