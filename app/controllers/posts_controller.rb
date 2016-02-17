class PostsController < ApplicationController

  def index
    @tweets = user_tweets
  end
end
