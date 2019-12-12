class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit, :update, :follows, :followers]
  
  def show
    @tweets = @user.tweets.order("created_at DESC").limit(10)
    @like_tweets = @user.like_tweets.order("created_at DESC").limit(10)
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
  end

  def followers
    @followers = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:avater, :name, :profile)
  end

  def user_find
    @user = User.find(params[:id])
  end

end
