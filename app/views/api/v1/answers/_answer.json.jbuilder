json.extract! answer, :id, :type, :created_at, :task_id, :user_id, :description
json.answer_image request.base_url + answer.answer_image.url
json.url api_v2_answer_url(answer, format: :json)
