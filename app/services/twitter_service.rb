class TwitterService
  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_ID"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token = 	user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def tweet(content)
    client.update(content, options={})
  end
end
