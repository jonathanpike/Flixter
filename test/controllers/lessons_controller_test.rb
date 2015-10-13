require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:cloning)
    @section = sections(:human_anatomy) 
    @lesson = lessons(:stomach)   
  end

  test "Should get show" do
    sign_in users(:cooper)

    get :show, id: @lesson.id
    assert_response :success
  end

  test "User needs to be enrolled for show" do
    sign_in users(:brand)

    get :show, id: @lesson.id
    assert_redirected_to course_path(@lesson.section.course)
  end
end
