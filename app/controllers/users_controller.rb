class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id]).order("created_at DESC")
  end

  def edit
    
  end

  def update
    if @user.id == current_user.id
      @user.update(user_params)
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:avater, :name, :profile)
  end

  def user_find
    @user = User.find(params[:id])
  end

end
