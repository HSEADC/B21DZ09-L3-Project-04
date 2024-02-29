class Task < ApplicationRecord
  has_many :answers, dependent: :destroy
  mount_uploader :first_answer_image, TaskImageUploader

  scope :active, -> { where("ending_at > ?", Time.now) }
end
