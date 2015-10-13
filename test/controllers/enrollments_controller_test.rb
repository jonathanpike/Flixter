require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @course = courses(:cloning)
    @user = users(:brand)
  end


  test "Enroll in free course" do
    sign_in @user

    assert_difference('@user.enrollments.count') do
      post :create, course_id: @course.id
    end

    assert_redirected_to course_path(@course)
  end
end
