class UsersController < ApplicationController
  before_action :set_user,only: [:edit, :show]

  def index
  end
  
  def edit
  end

  def update
      if current_user.update(user_params)
        redirect_to user_path(current_user.id)
      else
        redirect_to edit_user_path(current_user.id)
    end
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
    @icon_image = user.icon_image
    @profile = user.profile
    @email = user.email
  end

  # def profile
  #   user = User.find(params[:id])
  # end

  # def search
  #   user = User.find(params[:user_id])
  # end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :name ,:icon_image, :profile)
  end

  def set_user
    @users = User.all.page(params[:page]).per(5).order("created_at DESC")
  end
end
