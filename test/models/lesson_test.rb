require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "Lesson saved with valid input" do
    file = File.open("#{Rails.root}/test/fixtures/files/small.mp4")
    lesson = Lesson.create!(title: "Sample Lesson", subtitle: "This is a sample lesson", video: file)
    assert lesson.valid?
  end

  test "Lesson not saved without valid input" do
    lesson = Lesson.create(title: "Sample Lesson", subtitle: "This is a sample lesson")
    assert_not lesson.valid?
  end
end
