json.set! :create_url, api_v2_answers_url
json.set! :jti, User.find_by_email("user_1@email.com").jti

json.set! :answers do
  json.array! @answer, partial: "api/v2/answers/answer", as: :answer
end
