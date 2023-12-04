class ColourTask < Task
  validates :colour_hex, presence: true
end
