class PostsController < ApplicationController

  def index
    @tweets = TwitterService.new(current_user).user_tweets
  end

  def create
    byebug
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

  def unretweet
    TwitterService.new(current_user).retweets_of(params[:id])
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
end
