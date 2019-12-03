class CommentsController < ApplicationController
  before_action :move_to_signup
  before_action :comment_find, only: [:edit, :destroy, :update]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.tweet_id = params[:tweet_id]
    if@comment.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end
  
# 編集機能が実装できていない。
  # def edit
  # end

  # def update
  #   # @comment.user_id == current_user.id
  #   if @comment.update(comment_params)
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end 
  # end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end

  def comment_find
    @comment = Comment.find_by( id: params[:id], tweet_id: params[:tweet_id])
  end

end
