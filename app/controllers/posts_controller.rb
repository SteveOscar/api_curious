class PostsController < ApplicationController

  def index
    @tweets = TwitterService.new(current_user).user_tweets
  end

  def create
    TwitterService.new(current_user).tweet(params["q"])
    redirect_to dashboard_path
  end
end
