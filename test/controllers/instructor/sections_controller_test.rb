require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:cloning)
    @section = sections(:human_anatomy)
  end

  test "Get new" do 
    sign_in users(:amelia)

    get :new, course_id: @course
    assert_response :success    
  end

  test "Create new section" do
    sign_in users(:amelia)

    assert_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_redirected_to instructor_course_path(@course)
  end


  test "Needs to be authorized for new on current course" do
    sign_in users(:cooper)

    get :new, course_id: @course
    assert_response :unauthorized
  end

  test "Needs to be authorized for create on current course" do 
    sign_in users(:cooper)

    assert_no_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_response :unauthorized
  end

  test "Need to be signed in for new" do
    get :new, course_id: @course
    assert_redirected_to new_user_session_path
  end


  test "Needs to be signed in for create" do 
    assert_no_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_redirected_to new_user_session_path
  end

  test "Reorder Sections" do 
    sign_in users(:amelia)

    assert_difference('Section.row_order') do
      patch :update, id: @section.id, section: { row_order_position: 1 }
    end
  end
end
