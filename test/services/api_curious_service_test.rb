require 'test_helper'

class ApiCuriousServiceTest < ActiveSupport::TestCase
  test '#tweets' do
    VCR.use_cassette('example') do
      steven = users(:steven)
      user = TwitterService.new(steven)
      tweets = user.user_tweets

      refute tweets.nil?
      assert_equal 20, tweets.count
    end
  end

  # describe Example::Spec do
  #
  #   describe 'tweets', vcr: true do
  #     describe 'with a nested example group' do
  #       before do
  #         user = TwitterService.new(steven)
  #         @tweets = user.user_tweets
  #       end
  #       it 'uses a cassette for any examples' do
  #         @tweets.wont_equal nil
  #       end
  #     end
  #   end
  # end



end
