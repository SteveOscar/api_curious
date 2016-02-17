class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_tweets
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_tweets
    t = TwitterService.new(current_user)
    results = t.client.user_timeline[0..19]
    tweets = []
    results.each do |tweet, i|
      tweets << tweet.text
    end
    tweets
  end

  def user_feed
    t = TwitterService.new(current_user)
    results = t.client.home_timeline
    tweets = []
    results.each do |tweet, i|
      tweets << tweet
    end
    tweets
  end

  def tweet_card_data(tweet)

  end
end
