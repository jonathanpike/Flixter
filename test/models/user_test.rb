require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @course = courses(:cloning)
  end

  test "Cooper Enrolled In Cloning" do
    user = users(:cooper)
    expected = true
    actual = user.enrolled_in?(@course)
    assert_equal expected, actual
  end

  test "Amelia Not Enrolled in Cloning" do
    user = users(:amelia)
    expected = false
    actual = user.enrolled_in?(@course)
    assert_equal expected, actual
  end
end
