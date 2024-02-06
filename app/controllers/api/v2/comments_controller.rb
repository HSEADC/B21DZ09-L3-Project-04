class Api::V2::CommentsController < Api::V2::ApplicationController

  def index
    @comments = Comment.all
  end

  def show
  end
end
