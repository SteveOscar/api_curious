require 'test_helper'

class ApiCuriousServiceTest < ActiveSupport::TestCase
  test 'initialization' do
    VCR.use_cassette('example') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      assert user
    end
  end

  test '#tweets' do
    VCR.use_cassette('example') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      tweets = user.user_tweets

      refute tweets.nil?
      assert_equal 20, tweets.count
    end
  end

  test '#feed' do
    VCR.use_cassette('feed') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      feed = user.user_feed

      refute feed.nil?
      assert_equal 20, feed.count
      assert feed.first.text
    end
  end

    test '#user_mentions' do
      VCR.use_cassette('mentions') do
        steven = users(:steven)
        user = TwitterService.new(steven)
        mentions = user.user_mentions

        refute mentions.nil?
        assert mentions.first.text
      end
    end

  test '#retweets' do
    VCR.use_cassette('retweets') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      retweets = user.retweeted

      refute retweets.nil?
      assert retweets.first.text
    end
  end

  test '#followers' do
    VCR.use_cassette('followers') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      followers = user.followers

      refute followers.nil?
      assert followers.first.name
    end
  end

  test '#friends' do
    VCR.use_cassette('friends') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      friends = user.friends

      refute friends.nil?
      assert friends.first.name
    end
  end


end
