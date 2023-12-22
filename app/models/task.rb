class Task < ApplicationRecord
  has_many :answers, dependent: :destroy
  mount_uploader :first_answer_image, TaskImageUploader
end
