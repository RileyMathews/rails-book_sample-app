require "test_helper"

class UserTest < ActiveSupport::TestCase
  def create_valid_user
    User.new(name: "Example User", email: "user@example.com")
  end

  test "user should be valid" do
    user = create_valid_user

    assert user.valid?
  end

  test "users name should not be empty" do
    user = User.new(name: "      ", email: "user@example.com")

    assert_not user.valid?
  end

  test "users email should not be empty" do
    user = User.new(name: "Riley Mathews", email: "       ")

    assert_not user.valid?
  end

  test "users name should not be too long" do
    user = User.new(name: "a" * 51, email: "user@example.com")

    assert_not user.valid?
  end

  test "users email should not be too long" do
    user = User.new(name: "Riley", email: "a" * 255 + "@example.com")

    assert_not user.valid?
  end
end
