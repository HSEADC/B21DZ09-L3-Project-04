class Task < ApplicationRecord
  has_many :answers
  mount_uploader :first_answer_image, TaskImageUploader
  mount_uploader :ref_image, RefImageUploader
end
