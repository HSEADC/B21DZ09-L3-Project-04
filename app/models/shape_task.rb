class ShapeTask < Task
  validates :vector_shape, presence: true

  mount_uploader :vector_shape, TaskVectorUploader
end
