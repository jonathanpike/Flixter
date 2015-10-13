require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:cloning)
    @section = sections(:human_anatomy)    
  end

  test "Get new" do
    sign_in users(:amelia)

    get :new, section_id: @section.id
    assert_response :success
  end

  test "Create new lesson" do
    sign_in users(:amelia)

    assert_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!" }
    end

    assert_redirected_to instructor_course_path(@section.course.id)
  end

  test "Needs to be authorized for new on current section" do
    sign_in users(:cooper)

    get :new, section_id: @section.id
    assert_response :unauthorized
  end

  test "Needs to be authorized for create on current section" do 
    sign_in users(:cooper)

    assert_no_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!" }
    end

    assert_response :unauthorized
  end

  test "Need to be signed in for new" do
    get :new, section_id: @section.id
    assert_redirected_to new_user_session_path
  end


  test "Needs to be signed in for create" do 
    assert_no_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!" }
    end

    assert_redirected_to new_user_session_path
  end

end
