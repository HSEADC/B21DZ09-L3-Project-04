class Task < ApplicationRecord
  has_many :answers, dependent: :destroy
  mount_uploader :first_answer_image, TaskImageUploader

  has_many :markers
  has_many :users_who_marked, through: :markers, source: 'user'

  scope :active, -> { where("ending_at > ?", Time.now) }
end
