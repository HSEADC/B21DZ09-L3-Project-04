class Answer < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :comments, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader
  mount_uploader :answer_image, AnswerImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :answer_image, presence: true
end
