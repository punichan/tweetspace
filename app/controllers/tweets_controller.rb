class TweetsController < ApplicationController
  before_action :move_to_signup, except: :index, :show
  
  def index
    @tweets = Tweet.order("created_at DESC").limit(10)
    @users = User.order("created_at DESC").limit(10)
  end

  def new
    if user_signed_in?
      @tweet = Tweet.new 
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to action: :index
  end

  def show

  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:tweet, :image, :user_id)
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end
end
