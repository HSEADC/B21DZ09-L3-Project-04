class Answer < ApplicationRecord
  has_and_belongs_to_many :tasks
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader
end
