json.extract! task, :id, :type, :created_at, :task_of_day, :in_search, :active 
json.first_answer_image request.base_url + task.first_answer_image.url
json.url api_v1_task_url(task, format: :json)
