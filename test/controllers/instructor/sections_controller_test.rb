require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:sample)
  end

  test "Get new" do 
    sign_in users(:bob)

    get :new, course_id: @course
    assert_response :success    
  end

  test "Create new section" do
    sign_in users(:bob)

    assert_difference('Section.count') do
      post :create, course_id: @course.id, section: { title: "New section" }
    end

    assert_redirected_to instructor_course_path(@course)
  end

end
