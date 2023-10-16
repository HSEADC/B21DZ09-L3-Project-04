raw_text = 'К каждому заданию прилагаются специальные карточки, где описан художественный контекст челенджа и конкретные референсы. Это могут быть как фотографии Билла Каннингема, так и коллажи Сергея Параджанова. Это не только вспомогательный инструмент, но и отличный способ развить «насмотренность».'
@words = raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@task_names = [
    "Colour",
    "Form",
    "Typeface",
    "Composition",
    "Pattern",
    "Rhythm",
    "Abstraction",
    "Sound"
]

def seed
  reset_db
  create_tasks
  create_answers(100)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_sentence(quantity)
  sentence_words = []

  quantity.to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize
end

def upload_random_avatar
  uploader = AvatarUploader.new(Answer.new, :avatar)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images', '*')).sample))
  uploader
end

def upload_random_task_image
  uploader = TaskImageUploader.new(Task.new, :first_answer_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images', '*')).sample))
  uploader
end

def upload_random_ref_image
  uploader = RefImageUploader.new(Task.new, :ref_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images', '*')).sample))
  uploader
end

def upload_random_answer_image
  uploader = AnswerImageUploader.new(Answer.new, :answer_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images', '*')).sample))
  uploader
end

def create_tasks
  @task_names.each do |task_name|
    task = Task.create(
      name: task_name,
      description: create_sentence(10..40),
      first_answer_image: upload_random_task_image,
      ref_image: upload_random_ref_image
    )
    puts "Task with id #{task.id} and name #{task.name} just created"
  end
end

def create_answers(quantity)
  quantity.times do
    answer = Answer.create(
      name: create_sentence(1..3),
      description: create_sentence(4..20),
      avatar: upload_random_avatar,
      cover: upload_random_cover
    )

    puts "Answer with id #{answer.id} and name #{answer.name} just created"
  end
end


seed
