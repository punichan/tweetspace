class LikesController < ApplicationController
  before_action :move_to_signup
  def create
    like = current_user.likes.new(tweet_id: params[:tweet_id])
    like.save!
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    like.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end
end

