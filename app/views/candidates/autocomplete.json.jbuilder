json.candidates do
  json.array!(@candidates) do |candidate|
    json.name candidate.name
    json.url candidate_path(candidate)
  end
# end
# json.candidates do
#   json.array!(@candidates) do |candidate|
#     json.description candidate.description
#     json.url candidate_path(candidate)
#   end
# end
# json.by_name_candidates do
#   json.array!(@by_name_candidates) do |by_name_candidate|
#     json.name candidate.description
#     json.url candidate_path(by_name_candidate)
#   end
# end