require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @course = courses(:space_flight)
  end

  test "Get index" do 
    get :index
    assert_response :success
  end

  test "Get show" do
    get :show, id: @course
    assert_response :success
  end
end
