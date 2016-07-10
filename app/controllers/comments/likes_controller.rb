class Comments::LikesController < ApplicationController
  before_action :set_comment

  def create
    @comment.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @comment }
      format.js
    end
  end

  def destroy
    @comment.likes.where(user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to @comment }
      format.js
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end
end