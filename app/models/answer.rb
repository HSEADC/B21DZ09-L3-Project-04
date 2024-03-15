class Answer < ApplicationRecord
  belongs_to :task
  belongs_to :user

  has_many :comments, :dependent => :destroy
  has_many :poly_comments, as: :commentable, dependent: :destroy

  has_many :likes
  has_many :users_who_liked, through: :likes, source: 'user'

  mount_uploader :answer_image, TaskImageUploader

  self.per_page = 4

  # validates :name, presence: true
  # validates :description, presence: true
  validates :answer_image, presence: true
end
