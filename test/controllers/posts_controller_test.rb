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

  test "test create redirects to dashboard" do
    skip
    VCR.use_cassette('create') do
      user = users(:steven)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      get :create, :q => 34534534534, :status => 'bla bla bla'
      assert_response :success
      assert_equal rooth_path, current_path
    end
  end


end
