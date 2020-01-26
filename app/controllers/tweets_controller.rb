class TweetsController < ApplicationController
  before_action :move_to_signup, only: [:new, :create, :edit, :update, :destroy]
 
  def top
    @tweets = Tweet.order("created_at DESC").limit(8)
    @users = User.order("created_at DESC").limit(8)
  end
  
  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(50)
    @tweetss = Tweet.where('tweet LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
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
    if @tweet.save
      redirect_to tweet_path(@tweet.id)
    else
      redirect_to root_path
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweet_path(@tweet.id)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      @tweet.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def follows
    @user = User.find(params[:format])
    @finduser = User.find(current_user.id)
    @follows = @finduser.followings
    @FolTws = Tweet.where(user_id: @follows.ids).order("created_at DESC").page(params[:page]).per(10)
  end

  def likes
    @user = User.find(params[:format])
    @likes = @user.likes
    @LikTws = @likes.map{|like| Tweet.find(like.tweet_id)}
    @LikTws = Kaminari.paginate_array(@LikTws).page(params[:page]).per(50)
  end

  def mytweets
    @user = User.find(params[:format])
    @mytweets = Tweet.where(user_id: params[:format]).order("created_at DESC").page(params[:page]).per(50)
  end

  def comment_tweets
    @user = User.find(params[:format])
    @comments = @user.comments
    @comment_tweets = @comments.map{|comment| Tweet.find(comment.tweet_id)}
    @comment_tweets = Kaminari.paginate_array(@comment_tweets).page(params[:page]).per(50)
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id, :place_id, :category_id, :food, :price, :store, :image)
  end
  
end
