require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "test can get index" do
    VCR.use_cassette('index') do
      user = users(:steven)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      get :index
      assert_response :success
    end
  end

end
