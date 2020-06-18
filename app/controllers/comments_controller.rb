class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id])}
      # format.json 非同期保留
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
