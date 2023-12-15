class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def allTasks
     @tasks = Task.where(active: true)
  end

  def searchTasks
    @tasks = Task.where(in_search: true)
  end

  def howToPlay
  end
end
