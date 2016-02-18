class TwitterService
  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_ID"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token = 	user.token
      config.access_token_secret = user.secret
    end
  end

  def tweet(content)
    client.update(content, options={})
  end

  def user_tweets
    results = client.user_timeline[0..19]
    tweets = []
    results.each do |tweet, i|
      tweets << tweet.text
    end
    tweets
  end

  def user_feed
    client.home_timeline
  end

  def user_mentions
    client.mentions_timeline
  end

  def retweeted
    client.retweets_of_me
  end

  def followers
    client.followers
  end

  def friends
    client.friends
  end

  def retweet(tweet)
    client.retweet!(tweet)
  end
end
