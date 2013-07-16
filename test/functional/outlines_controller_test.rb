require 'test_helper'

class OutlinesControllerTest < ActionController::TestCase
  test "should get agenda" do
    get :agenda
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

end
