class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def about
    @users = User.all
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集が完了しました🌱"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
 
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
end