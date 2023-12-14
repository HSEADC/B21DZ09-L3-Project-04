json.extract! task, :id, :created_at, :updated_at, :type, :first_answer_image
# :vector_shape, :vector_font, :vector_regularity, :texture_image, :colour_hex
json.url task_url(task, format: :json)
