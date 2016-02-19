require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "invalid user is redirected" do
    VCR.use_cassette('bad_login') do
      user = users(:carl)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit '/sessiontest'
      assert_equal root_path, current_path
    end
  end



end
