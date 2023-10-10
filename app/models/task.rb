class Task < ApplicationRecord
  # has_and_belongs_to_many :answers
  mount_uploader :example, ExampleUploader
  mount_uploader :image, CoverUploader

  has_many :comments, :dependent => :destroy
end
