class UsersController < ApplicationController
  def index
  end
  
  def edit
  end

  def update
    def update
      if current_user.update(user_params)
        redirect_to root_path
        
      else
        redirect_to edit_user_path(current_user.id)
      end
    end
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
    @icon_image = user.icon_image
  end

  def profile
    user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :name ,:icon_image, :profile)
  end
end
