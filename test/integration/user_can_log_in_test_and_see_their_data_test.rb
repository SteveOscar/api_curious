require "test_helper"

class UserCanLogInAndSeeDataTest < ActionDispatch::IntegrationTest

  def setup
    # request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.mock_auth[:twitter]
  end

  test "a user can log in via twitter omniauth, see data, and post" do
    visit root_path
    click_on "Login with Twitter"

    assert_equal "/dashboard", current_path
    assert page.has_content?('Hi, Steven Olson')

    click_on "Your Posts"
    assert_equal posts_path, current_path
    assert page.has_content?('Your Tweets')
    assert page.has_css?(".tweet-card")

    click_on "Dashboard"
    click_on "Timeline"
    assert_equal '/feed', current_path
    assert page.has_content?('Your Feed')
    assert page.has_css?(".retweet")

    click_on "Dashboard"
    fill_in('q', :with => 'John')
    click_link('#tweet')

    click_on "Mentions"
    assert_equal '/mentions', current_path
    assert page.has_content?("You've been mentioned")
    assert page.has_css?(".tweet-card")
  end

end
