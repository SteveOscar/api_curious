require "test_helper"

class UserCanLogInAndSeeDataTest < ActionDispatch::IntegrationTest

  def setup
    OmniAuth.config.mock_auth[:twitter]
  end

  test "a user can log in via twitter omniauth, see data, and post" do
    visit root_path
    click_on "Login with Twitter"

    assert_equal "/dashboard", current_path
    assert page.has_content?('Hi, Steven Olson')

    VCR.use_cassette('posts') do
      click_on "Your Posts"
      assert_equal posts_path, current_path
      assert page.has_content?('Your Tweets')
      assert page.has_css?(".tweet-card")
    end

    VCR.use_cassette('dashboard') do
      click_on "Dashboard"
    end

    VCR.use_cassette('timeline') do
      click_on "Timeline"
      assert_equal '/feed', current_path
      assert page.has_content?('Your Feed')
      assert page.has_css?(".retweet")
      click_on ''
    end

    VCR.use_cassette('dashboard') do
      click_on "Dashboard"
      fill_in('q', :with => 'John')
    end

    VCR.use_cassette('mentions') do
      click_on "Mentions"
      assert_equal '/mentions', current_path
      assert page.has_content?("You've been mentioned")
      assert page.has_css?(".tweet-card")
    end
  end

end
