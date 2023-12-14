class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def allTasks
     @tasks = Task.all
  end

  def searchTasks
  end

  def howToPlay
  end
end
