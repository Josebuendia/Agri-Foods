require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
   # @user = User.new(email: 'liam@rock.com')
   @user = users(:one)

  end

  test 'valid user' do
    assert @user.valid?
  end

  test '#orders' do
    assert_equal 1, @user.orders.size
  end

  # test 'invalid without name' do
  #   @user. = nil
  #   refute @user.valid?, 'saved user without a name'
  #   assert_not_nil @user.errors[:name], 'no validation error for name present'
  # end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
end
