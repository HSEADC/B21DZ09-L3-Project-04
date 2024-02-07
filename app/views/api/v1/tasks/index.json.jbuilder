json.set! :create_url, api_v1_tasks_url
json.set! :jti, User.find_by_email("user_1@email.com").jti

json.set! :tasks do
  json.array! @tasks, partial: "api/v1/tasks/task", as: :task
end
