require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @course = courses(:sample)
  end

  test "Should get new" do
    sign_in users(:bob)

    get :new
    assert_response :success
  end

  test "Should create course" do
    sign_in users(:bob)

    assert_difference('Course.count') do
      post :create, course: { title: @course.title, description: @course.description, cost: @course.cost }
    end

    assert_redirected_to instructor_course_path(assigns(:course))
  end

  test "Should get show" do
    sign_in users(:bob)

    get :show, id: @course
    assert_response :success
  end
end
