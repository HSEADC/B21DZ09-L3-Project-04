class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def allTasks
     @vote_tasks = Task.where(active: false).take(4)
     @active_tasks = Task.where(active: true).sample(5)
     @random_task = Task.where(active: false).sample
     if user_signed_in?
     @profile_answers = Answer.where(user_id: current_user.id).take(4)
    end
  end

  def searchTasks
    @search_tasks = Task.where(in_search: true)
    @expire_tasks = Task.where(in_search: true).take(2)
  end

  def howToPlay
  end

  def profile
  end
end
