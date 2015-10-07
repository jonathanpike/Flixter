require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Course saved with valid input" do 
    course = Course.create(title: 'Course Title', description: 'Course Description', cost: '5')
    assert course.valid?
  end

  test "Course doesn't save without all parameters" do
    course = Course.create(title: 'Course Title')
    assert_not course.valid?
  end
end
