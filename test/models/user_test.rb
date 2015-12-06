require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username must be unique" do
    user = User.new(username: users(:one).username,
                    password: 'pass',
                    password_confirmation: 'pass')
    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:username]
  end
end
