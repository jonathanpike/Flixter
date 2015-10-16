require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "Lesson saved with valid input" do
    lesson = Lesson.create!(title: "Sample Lesson", subtitle: "This is a sample lesson", video: "small.mp4")
    assert lesson.valid?
  end

  test "Lesson not saved without valid input" do
    lesson = Lesson.create(title: "Sample Lesson", subtitle: "This is a sample lesson")
    assert_not lesson.valid?
  end
end
