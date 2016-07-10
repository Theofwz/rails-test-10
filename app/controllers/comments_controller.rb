class CommentsController < ApplicationController
  def index
    @comment_parent = Comment.comment_parent 
  end

  def create
    @comment = Comment.new(comment_params)
    success = @comment.save
  end

  def update
    @comment = Comment.new(comment_params)
    success = @comment.update
  end

  private

    def comment_params
      data = params.require(:comment).permit(:content, :parent_id)
      data[:user] = current_user
      data
    end
end