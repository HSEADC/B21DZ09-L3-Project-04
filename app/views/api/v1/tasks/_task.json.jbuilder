json.extract! task, :name, :description, :created_at
json.ref_image request.base_url + task.ref_image.url
json.first_answer_image request.base_url + task.first_answer_image.url
json.url api_v1_task_url(task, format: :json)
