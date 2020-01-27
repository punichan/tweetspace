class CommentsController < ApplicationController
  before_action :move_to_signup
  before_action :comment_find, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.tweet_id = params[:tweet_id]
    if@comment.save!
      redirect_to tweet_path(params[:tweet_id])
    else
      redirect_to root_path
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:tweet_id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to tweet_path(params[:tweet_id])
    else
      redirect_to root_path
    end 
  end

  def destroy
    if @comment.destroy
      redirect_to tweet_path(params[:tweet_id])
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def comment_find
    @comment = Comment.find_by( id: params[:id], tweet_id: params[:tweet_id])
  end

end