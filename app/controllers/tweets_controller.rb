class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :search_action,only: [:index, :new, :show, :edit]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    # @tweets = current_user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to action: :index 
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to action: :index 
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index 
  end

  def search
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    @q = Tweet.search(search_params)
    @searches = @q.result(distinct: true)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def search_action
    @q = Tweet.ransack(params[:q])
    @searches = @q.result(distinct: true)
  end

  def search_params
    params.require(:q).permit!
  end

end
