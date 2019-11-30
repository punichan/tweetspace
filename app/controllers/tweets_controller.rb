class TweetsController < ApplicationController
  before_action :move_to_signup, except: [:index, :show]
  before_action :tweet_find, only: [:show, :edit, :destroy, :update]
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

  def edit
  end

  def update
    if @tweet.user_id == current_user.id?
      @tweet.update(tweet_params)
    end
    redirect_to root_path
  end

  def destroy
    if @tweet.user_id == current_user.id?
      @tweet.destroy
    end
    redirect_to root_path
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:tweet, :image, :user_id)
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def tweet_find
    @tweet = Tweet.find(params[:id])
  end

end
