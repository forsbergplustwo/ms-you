json.extract! symptom, :id, :title, :description, :start_date, :severity, :created_at, :updated_at
json.url symptom_url(symptom, format: :json)
