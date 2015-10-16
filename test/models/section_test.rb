require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test "Section saved with valid input" do
    section = Section.create(title: "Section 1")
    assert section.valid?
  end

  test "Section not saved without valid input" do
    section = Section.create(title: "")
    assert_not section.valid?
  end
end
