json.extract! task, :id, :name, :description, :ref_image, :first_answer_image, :created_at, :updated_at
json.url task_url(task, format: :json)
