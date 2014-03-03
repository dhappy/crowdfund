json.array!(@projects) do |project|
  json.extract! project, :id, :github_name, :name, :owner
  json.url project_url(project, format: :json)
end
