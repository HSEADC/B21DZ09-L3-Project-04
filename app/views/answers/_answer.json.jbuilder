json.extract! answer, :id, :name, :description, :avatar, :answer_image, :created_at, :updated_at
json.url answer_url(answer, format: :json)
