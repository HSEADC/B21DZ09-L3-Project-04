raw_text = 'К каждому заданию прилагаются специальные карточки, где описан художественный контекст челенджа и конкретные референсы. Это могут быть как фотографии Билла Каннингема, так и коллажи Сергея Параджанова. Это не только вспомогательный инструмент, но и отличный способ развить «насмотренность».'
@words = raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@task_names = [
    "Colour",
    "Shape",
    "Font",
    "Regularity",
    "Texture"
]

def seed
  reset_db
  create_admin
  create_users
  create_tasks
  create_answers(10)
  create_comments(5)
  create_comment_replies(100)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def clean_content_folders
  FileUtils.rw_rf('public/uploads')
end

def create_admin
  user_data = {
    email: "admin@email.com",
    password: 'testtest',
    admin: true
  }

  user = User.create!(user_data)
  puts "Admin created with id #{user.id}"
end


def create_users
  i = 0

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end

def create_sentence(quantity)
  sentence_words = []

  quantity.to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize
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
      first_answer_image: upload_random_task_image,
      ref_image: upload_random_ref_image
    )
    puts "Task with id #{task.id} just created"
  end
end

def create_answers(quantity)
  tasks = Task.all

  tasks.each do |task|
  quantity.times do
    user = User.all.sample
    answer = Answer.create(
      task_id: task.id,
      avatar: upload_random_avatar,
      answer_image: upload_random_answer_image,
      user_id: user.id
    )

      puts "Answer with id #{answer.id} for task with id #{answer.task.id} just created"
    end
  end
end

def create_comments(quantity)
  answers = Answer.all

  answers.each do |answer|
  quantity.times do
    user = User.all.sample
    comment = Comment.create(
      answer_id: answer.id,
      body: create_sentence(4..20),
      user_id: user.id
    )

      puts "Comment with id #{comment.id} for answer with id #{comment.answer.id} just created"
    end
  end
end

def create_comment_replies(quantity)
  quantity.times do
    comment = Comment.all.sample
    user = User.all.sample
    reply = comment.replies.create(
      answer_id: comment.answer.id,
      body: create_sentence(4..20),
      user_id: user.id
    )

      puts "Comment reply with id #{reply.id} for comment with id #{comment.id} just created"
  end
end

seed
