require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @users = users(:one) 
    login_as(@users) 
  end
  test "should get index" do
    get cart_index_url
    assert_response :success
  end

end
