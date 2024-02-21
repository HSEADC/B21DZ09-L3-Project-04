class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
    @random_answers = Answer.take(8)
    @onboarding = Onboarding.where(id: 1)

    # Meta
    set_meta_tags(
      title: "Добро пожаловать",
      description: "Привет! Участвуй в креативных заданиях команды refs и прокачивай свою креативность и насмотренность",
      keywords: "refs, reference, creative"
    )
    # end
  end

  def about
    # Meta
    set_meta_tags(
      title: "Команда",
      description: "Познакомься с командой refs",
      keywords: "refs, reference, creative"
    )
    # end
  end

  def allTasks
     @vote_tasks = Task.where(active: false).take(4)
     @active_tasks = Task.where(active: true).sample(5)
     @random_task = Task.where(active: false).sample
     if user_signed_in?
     @profile_answers = Answer.where(user_id: current_user.id).take(4)
    end

    # Meta
    set_meta_tags(
      title: "Все задания",
      description: "Найди для себя подходящее креативное задание и насладись ответами других пользователей refs",
      keywords: "refs, reference, creative"
    )
    # end
  end

  def searchTasks
    @search_tasks = Task.where(in_search: true)
    @expire_tasks = Task.where(in_search: true).take(2)

    # Meta
    set_meta_tags(
      title: "В поиске",
      description: "Здесь тебя ждут все задания от refs, на которые ты откликнулся",
      keywords: "refs, reference, creative"
    )
    # end
  end

  def howToPlay
    # Meta
    set_meta_tags(
      title: "Как играть",
      description: "Узнай о том, как прокачать свою креативность вместе с refs",
      keywords: "refs, reference, creative"
    )
    # end
  end

end
