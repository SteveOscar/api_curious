require 'test_helper'

class UserCreationTest < ActiveSupport::TestCase
  test "user can be created with valid attributes" do
    auth = {'provider' => 'twitter',
            'uid' => '2222',
            'info' => {
                'name' => 'Carl',
                'description' => 'some guy',
                'image' => 'http://pbs.twimg.com/profile_images/676288331215335424/xFUgQmzk_normal.jpg'
            },
            'credentials' => {
                'token' => ENV['USER_TOKEN'],
                'secret' => ENV['USER_SECRET']
            }
    }

    User.find_or_create_by_auth(auth)
    user = User.last.name

    assert_equal 'Carl', user
  end

  test "user is not created with missing attributes" do
    auth = { 'provider' => 'twitter'}

    count1 = User.all.count
    User.find_or_create_by_auth(auth)
    count2 = User.all.count

    assert_equal count1, count2
  end
end
