class UsersController < ApplicationController
  
  def index
    @users = User.order("created_at DESC").page(params[:page]).per(40)
    @userss = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
    @follows = @user.followings
    @followsTws = Tweet.where(user_id: @follows.ids).order("created_at DESC").limit(50)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_params)
    end
      redirect_to user_path(current_user.id)
  end

  def follows
    @user = User.find(params[:id])
    @follows = @user.followings
    @follows = Kaminari.paginate_array(@follows).page(params[:page]).per(40)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    @followers = Kaminari.paginate_array(@followers).page(params[:page]).per(40)
  end

  private
  
  def user_params
    params.require(:user).permit(:avater, :name, :profile)
  end

end
