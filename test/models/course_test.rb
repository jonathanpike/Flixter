require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Course needs valid input" do 
    course = Course.new
    assert_not course.save 
  end

  test "Course saved with valid input" do
    assert_equal 1, Course.count
  end
end
