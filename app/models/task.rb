class Task < ApplicationRecord
  has_many :answers, dependent: :destroy
  # validates :name, presence: true
  # validates :description, presence: true
  # mount_uploader :first_answer_image, TaskImageUploader
  # mount_uploader :ref_image, RefImageUploader
end
