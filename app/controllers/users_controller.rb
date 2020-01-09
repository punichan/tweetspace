class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit, :update, :follows, :followers]
  # before_action :follows_find, only: [:show, :follows]
  
  def index
    @users = User.order("created_at DESC").page(params[:page]).per(40)
    
  end

  def show
    @follows = @user.followings
    @tweets = @user.tweets.order("created_at DESC").limit(50)
    @like_tweets = @user.like_tweets.order("created_at DESC").limit(10)
    @followsTws = Tweet.where(user_id: @follows.ids).order("created_at DESC").limit(50)
  end

  def edit
    
  end

  def update
    if @user.id == current_user.id
      @user.update(user_params)
    end
    redirect_to user_path(current_user.id)
  end

  def follows
    @follows = @user.followings
    @follows = Kaminari.paginate_array(@follows).page(params[:page]).per(40)
  end

  def followers
    @followers = @user.followers
    @followers = Kaminari.paginate_array(@followers).page(params[:page]).per(40)
  end

  private
  def user_params
    params.require(:user).permit(:avater, :name, :profile)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
