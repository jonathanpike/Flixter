require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "Should get index" do
    get :index
    assert_response :success    
  end

  test "Should get team" do
    get :team
    assert_response :success
  end

  test "Should get privacy" do
    get :privacy
    assert_response :success
  end

  test "Should get careers" do
    get :careers
    assert_response :success
  end
end
