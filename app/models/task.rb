class Task < ApplicationRecord
  has_and_belongs_to_many :answers
  mount_uploader :example, ExampleUploader
end
