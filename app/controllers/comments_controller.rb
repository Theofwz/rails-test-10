class CommentsController < ApplicationController
  def index
    @comment_parent = Comment.comment_parent 
  end
end