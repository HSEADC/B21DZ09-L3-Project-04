class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def tasksThemes
    @tasks = Task.all
  end
end
