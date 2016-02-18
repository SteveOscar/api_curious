require "test_helper"

class UserCanLogInTest < ActionDispatch::IntegrationTest

  def setup
    # request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.mock_auth[:twitter]
  end

  test "a user can log in via twitter omniauth" do
    skip
    visit root_path
    click_on "Login with Twitter"

    assert_equal "/dashboard", current_path
    assert page.has_content?('Hi, Steven Olson')
  end

end
