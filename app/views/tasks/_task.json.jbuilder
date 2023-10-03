json.extract! task, :id, :name, :description, :example, :created_at, :updated_at
json.url task_url(task, format: :json)
