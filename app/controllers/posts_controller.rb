class PostsController < ApplicationController

  def index
    @tweets = TwitterService.new(current_user).user_tweets
  end
end
