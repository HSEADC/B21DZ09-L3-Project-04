class RegularityTask < Task
  validates :vector_regularity, presence: true

  mount_uploader :vector_regularity, TaskImageUploader
end
