require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    OmniAuth.config.mock_auth[:twitter]
  end

  test "invalid user is redirected" do
    OmniAuth.config.mock_auth[:twitter]
    VCR.use_cassette('bad_login') do
      user = users(:carl)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit '/sessiontest'
      assert_equal root_path, current_path
    end
  end



end
