class LikesController < ApplicationController
  
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
end
