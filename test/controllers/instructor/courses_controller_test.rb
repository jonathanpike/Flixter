require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @course = courses(:cloning)
  end

  test "Should get new" do
    sign_in users(:amelia)

    get :new
    assert_response :success
  end

  test "User needs to be signed in before new" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "Should create course" do
    sign_in users(:amelia)

    assert_difference('Course.count') do
      post :create, course: { title: @course.title, description: @course.description, cost: @course.cost }
    end

    assert_redirected_to instructor_course_path(assigns(:course))
  end

  test "Need to be signed in before create" do
    assert_no_difference('Course.count') do
       post :create, course: { title: @course.title, description: @course.description, cost: @course.cost }
    end

     assert_redirected_to new_user_session_path
  end

  test "Should get show" do
    sign_in users(:amelia)

    get :show, id: @course
    assert_response :success
  end

  test "Need to be signed in before show" do
    get :show, id: @course
    assert_redirected_to new_user_session_path
  end
end
