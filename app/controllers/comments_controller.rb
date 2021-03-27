class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.create(comments_params)
  end

  private

  def load_commentable
    klass = [Tweet, Comment].detect { |c| params["#{c.name.underscore}_id"] }
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def comments_params
    params.require(:comment).permit(:body, :user_id)
  end
end