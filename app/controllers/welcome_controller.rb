class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def allTasks
     @vote_tasks = Task.where(active: false).take(4)
     @active_tasks = Task.where(active: true).take(10)
     if user_signed_in?
     @profile_answers = Answer.where(user_id: current_user.id).take(4)
    end
  end

  def searchTasks
    @tasks = Task.where(in_search: true)
  end

  def howToPlay
  end

  def profile
  end
end
