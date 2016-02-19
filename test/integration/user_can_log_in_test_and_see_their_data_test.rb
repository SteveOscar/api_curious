require "test_helper"

class UserCanLogInAndSeeDataTest < ActionDispatch::IntegrationTest

  def setup
    # OmniAuth.config.mock_auth[:twitter] = nil
  end

  test "a user can log in via twitter omniauth, see data, and post" do
    OmniAuth.config.mock_auth[:twitter]
    visit root_path
    VCR.use_cassette('dashboard') do
      click_on "Login with Twitter"
    end

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
    end

    VCR.use_cassette('retweet') do
      within('.card1') do
        assert page.has_button?('Retweet')
        click_on 'Retweet'
      end
    end

    VCR.use_cassette('like') do
      within('.card1') do
        assert page.has_link?('favorite')
        click_on 'favorite'
      end
    end

    VCR.use_cassette('unfollow') do
      within('.card0') do
        assert page.has_button?('Unfollow')
        click_on 'Unfollow'
      end
    end

    VCR.use_cassette('dashboard') do
      click_on "Dashboard"
    end

    fill_in('q', :with => 'John')
    click_on 'send-tweet'


    VCR.use_cassette('mentions') do
      click_on "Mentions"
      assert_equal '/mentions', current_path
      assert page.has_content?("You've been mentioned")
      assert page.has_css?(".tweet-card")
    end

    VCR.use_cassette('dashboard') do
      click_on "Dashboard"
    end

    VCR.use_cassette('retweets') do
      click_on "Retweets"
      assert_equal '/retweeted', current_path
      assert page.has_content?("Retweets of you")
      assert page.has_css?(".tweet-card")
    end

    click_on "Logout"
    assert_equal root_path, current_path

  end

  test 'invalid user is redirected' do
    OmniAuth.config.mock_auth[:twitter] = nil
    OmniAuth.config.mock_auth[:github]

    visit root_path

    click_on "Login with Twitter"

    assert_equal root_path, current_path
  end

end
