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

  test "Cloning is Free" do
    course = courses(:cloning)
    expected = true
    actual = course.free?
    assert_equal expected, actual
  end

  test "Space Flight is Premium" do
    course = courses(:space_flight)
    expected = true
    actual = course.premium?
    assert_equal expected, actual
  end

  test "Space Flight is not Free" do
    course = courses(:space_flight)
    expected = false
    actual = course.free?
    assert_equal expected, actual
  end

end
