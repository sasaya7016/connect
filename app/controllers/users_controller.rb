class UsersController < ApplicationController
  def index
  end
  
  def edit
  end

  def update
  end

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @tweets = current_user.tweets
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def profile
    user = User.find(params[:id])
  end
end
