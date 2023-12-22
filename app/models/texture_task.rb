class TextureTask < Task
  validates :texture_image, presence: true
  mount_uploader :texture_image, TaskImageUploader
end
