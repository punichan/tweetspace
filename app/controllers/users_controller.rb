class UsersController < ApplicationController
  before_action :user_find, except: [:index]
  
  def index
    @users = User.order("created_at DESC").page(params[:page]).per(40)
    @userss = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @follows = @user.followings
    @followsTws = Tweet.where(user_id: @follows.ids).order("created_at DESC").limit(50)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
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
