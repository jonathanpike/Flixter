require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @course = courses(:sample)
  end

  test "Get index" do 
    get :index
    assert_response :success
  end
end
