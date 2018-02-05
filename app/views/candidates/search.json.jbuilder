json.candidates do
  json.array!(@candidates) do |candidate|
    json.name candidate.name+' | '+candidate.description+' | '+candidate.dev_language
    json.url candidate_path(candidate)
  end
end
