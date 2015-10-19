require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:cloning)
    @section = sections(:human_anatomy)  
    @lesson = lessons(:brain)  
    @file = Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/small.mp4", "image/jpeg")
  end

  test "Create new lesson" do
    sign_in users(:amelia)

    assert_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!", video: @file }
    end

    assert_redirected_to instructor_course_path(@section.course.id)
  end

  test "Needs to be authorized for create on current section" do 
    sign_in users(:cooper)

    assert_no_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!", video: @file }
    end

    assert_response :unauthorized
  end

  test "Needs to be signed in for create" do 
    assert_no_difference('Lesson.count') do
      post :create, section_id: @section.id, lesson: { title: "New lesson", subtitle: "This is a new lesson!", video: @file }
    end

    assert_redirected_to new_user_session_path
  end

  test "Reorder Lessons" do 
    sign_in users(:amelia)

    first_lesson = Lesson.where(section_id: @lesson.section_id).order(row_order: :asc).first
    assert_equal @lesson, first_lesson
    patch :update, id: @lesson.id, lesson: { row_order_position: 1 }
    last_lesson = Lesson.where(section_id: @lesson.section_id).order(row_order: :asc).last
    assert_equal @lesson, last_lesson
    assert_equal 2, Lesson.where(section_id: @lesson.section_id).count
  end

end
