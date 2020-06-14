class LikesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_tweet, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    redirect_to root_path
    
    # unless like.save
    #   flash.now[:alert] = like.errors.full_messages
    # end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    redirect_to root_path

    # unless like.destroy
    #   flash.now[:alert] = '削除できませんでした。'
    # end
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
