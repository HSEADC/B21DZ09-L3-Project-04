json.extract! comment, :id, :created_at, :answer_id, :user_id, :body, :reply_to_comment_id
json.url api_v2_comment_url(comment, format: :json)
