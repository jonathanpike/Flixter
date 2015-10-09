require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:sample)
    @section = sections(:sample)    
  end

  test "Get new" do
    sign_in users(:bob)

    get :new, section_id: @section.id
    assert_response :success
  end

  test "Create new lesson" do
    sign_in users(:bob)

    assert_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!" }
    end

    assert_redirected_to instructor_course_path(@section.course.id)
  end

end
