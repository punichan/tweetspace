class TweetsController < ApplicationController
  before_action :move_to_signup, except: [:index, :show]
  before_action :tweet_find, only: [:show, :edit, :destroy, :update]
  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(4)
    @users = User.order("created_at DESC").limit(10)
    
    # @userss = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    # @tweetss = Tweet.where('tweet LIKE(?)', "%#{params[:keyword]}%")
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
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
      redirect_to root_path
      # user_path(current_user.id)
  end

  def show
    @comments = @tweet.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
      @tweet.update(tweet_params)
      redirect_to user_path(current_user.id)
  end

  def destroy
    if @tweet.user_id == current_user.id
      @tweet.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id, :place_id, :category_id, :food, :price, :store, :image)
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def tweet_find
    @tweet = Tweet.find(params[:id])
  end

end
