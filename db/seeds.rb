raw_text = 'К каждому заданию прилагаются специальные карточки, где описан художественный контекст челенджа и конкретные референсы. Это могут быть как фотографии Билла Каннингема, так и коллажи Сергея Параджанова. Это не только вспомогательный инструмент, но и отличный способ развить «насмотренность».'
@words = raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@task_types = [
  "ColourTask",
  "FontTask",
  "TextureTask",
  "RegularityTask",
  "ShapeTask"
]

@colour_hexes = [
  "#C77DFF",
  "#F94144",
  "#F2542D",
  "#4361EE",
  "#FFCA3A",
  "#2196F3",
  "#FF595E",
  "#AB274F",
  "#87B650",
  "#542EFF",
  "#444041",
  "#511281"
]

def seed
  reset_db
  create_admin
  create_users
  create_active_tasks(2)
  create_inactive_tasks(2)
  create_answers(5)
  create_comments(5)
  create_comment_replies(50)
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

def create_task_name(quantity)
  if @task_type == "ColourTask"
    sentence = "C#{id}"
  elsif @task_type == "FontTask"
    sentence = "F#{id}"
  elsif @task_type == "ShapeTask"
    sentence = "S#{id}"
  elsif @task_type == "RegularityTask"
    sentence = "R#{id}"
  elsif @task_type == "TextureTask"
    sentence = "T#{id}"
  end
end

def create_sentence(quantity)
  sentence_words = []

  quantity.to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize
end

def upload_random_image
  uploader = TaskImageUploader.new(Task.new, :first_answer_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images/answers', '*')).sample))
  uploader
end

def upload_random_shape_vector
  uploader = TaskImageUploader.new(Task.new, :vector_shape)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images/shapes', '*')).sample))
  uploader
end

def upload_random_font_vector
  uploader = TaskImageUploader.new(Task.new, :vector_font)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images/fonts', '*')).sample))
  uploader
end

def upload_random_regularity_vector
  uploader = TaskImageUploader.new(Task.new, :vector_regularity)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images/regularities', '*')).sample))
  uploader
end

def upload_random_texture_image
  uploader = TaskImageUploader.new(Task.new, :texture_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images/textures', '*')).sample))
  uploader
end



def create_active_tasks(quantity)
  @task_types.each do |task_type|
  quantity.times do
    task = Task.create(
      type: task_type,
      name: create_task_name(1),
      active: true,
      in_search: true,
      first_answer_image: upload_random_image,
      colour_hex: @colour_hexes.sample,
      vector_shape: upload_random_shape_vector,
      vector_font: upload_random_font_vector,
      vector_regularity: upload_random_regularity_vector,
      texture_image: upload_random_texture_image,
      ref: false
  )
    puts "Task with id #{task.id} just created"
    end
  end
end

def create_inactive_tasks(quantity)
  @task_types.each do |task_type|
    quantity.times do

    # p = nil
    #
    # if task_type == "ColourTask"
    #   p = colour_hex: @colour_hexes.sample
    # elsif task_type == "ShapeTask"
    #   p = vector_shape: upload_random_shape_vector
    # elsif task_type == "FontTask"
    #   p = vector_font: upload_random_font_vector
    # elsif task_type == "RegularityTask"
    #   p = vector_regularity: upload_random_regularity_vector
    # elsif task_type == "TextureTask"
    #   p = texture_image: upload_random_texture_image

    task = Task.create(
      type: task_type,
      name: create_task_name(1),
      active: false,
      in_search: false,
      first_answer_image: upload_random_image,
      colour_hex: @colour_hexes.sample,
      vector_shape: upload_random_shape_vector,
      vector_font: upload_random_font_vector,
      vector_regularity: upload_random_regularity_vector,
      texture_image: upload_random_texture_image,
      ref: true
  )
    puts "Task with id #{task.id} just created"
    end
  end
end

def create_answers(quantity)
  tasks = Task.all

  tasks.each do |task|
  quantity.times do
    user = User.all.sample
    answer = Answer.create(
      task_id: task.id,
      answer_image: upload_random_image,
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
