require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:cloning)
    @section = sections(:human_anatomy)
  end

  test "Create new section" do
    sign_in users(:amelia)

    assert_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_redirected_to instructor_course_path(@course)
  end


  test "Needs to be authorized for create on current course" do 
    sign_in users(:cooper)

    assert_no_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_response :unauthorized
  end


  test "Needs to be signed in for create" do 
    assert_no_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_redirected_to new_user_session_path
  end

  test "Reorder Sections" do 
    sign_in users(:amelia)

    first_section = Section.where(course_id: @section.course_id).order(row_order: :asc).first
    assert_equal @section, first_section
    patch :update, id: @section.id, section: { row_order_position: 1 }
    last_section = Section.where(course_id: @section.course_id).order(row_order: :asc).last
    assert_equal @section, last_section
    assert_equal 2, Section.where(course_id: @section.course_id).count
  end
end
