class Answer < ApplicationRecord
  belongs_to :task
  belongs_to :user

  has_many :comments, :dependent => :destroy
  has_many :poly_comments, as: :commentable, dependent: :destroy

  mount_uploader :answer_image, TaskImageUploader

  # validates :name, presence: true
  # validates :description, presence: true
  validates :answer_image, presence: true
end
