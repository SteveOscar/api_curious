class PostsController < ApplicationController

  def index
    @tweets = TwitterService.new(current_user).user_tweets
  end

  def create
    TwitterService.new(current_user).tweet(params["q"])
    redirect_to dashboard_path
  end

  def retweet
    TwitterService.new(current_user).retweet(params[:id])
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def favorite
    TwitterService.new(current_user).favorite(params[:id])
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def unfollow
    TwitterService.new(current_user).unfollow(params[:id].to_i)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
end
