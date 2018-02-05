json.extract! candidate, :id, :name, :description, :image, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
