class UsersController < ApplicationController

  def show
    @user = User.where(id: params[:id])
    @tweets = Tweet.where(user_id: params[:id]).order("created_at DESC")

  end

end
