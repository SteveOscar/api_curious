class PostsController < ApplicationController

  def index
    t = TwitterService.new(current_user)
    results = t.client.user_timeline[0..19]
    @tweets = []
    results.each do |tweet, i|
      @tweets << tweet.text
    end
  end
end
