require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "Should get index" do
    get :index
    assert_response :success    
  end
end
