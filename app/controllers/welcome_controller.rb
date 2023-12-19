class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def allTasks
     @vote_tasks = Task.where(active: false).take(4)
     @active_tasks = Task.where(active: true).take(10)
  end

  def searchTasks
    @tasks = Task.where(in_search: true)
  end

  def howToPlay
  end
end
