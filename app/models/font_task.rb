class FontTask < Task
  validates :vector_font, presence: true

  mount_uploader :vector_font, TaskImageUploader
end
