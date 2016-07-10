class CommentsController < ApplicationController
  def index
    @comment_parent = Comment.comment_parent 
  end

  def create
    @comment = Comment.new(comment_params)
    success = @comment.save
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :parent_id)
    end
end