require "application_system_test_case"

class GradersTest < ApplicationSystemTestCase
  setup do
    @grader = graders(:one)
  end

  test "visiting the index" do
    visit graders_url
    assert_selector "h1", text: "Graders"
  end

  test "should create grader" do
    visit graders_url
    click_on "New grader"

    fill_in "Email", with: @grader.email
    fill_in "Fname", with: @grader.fname
    fill_in "Lname", with: @grader.lname
    click_on "Create Grader"

    assert_text "Grader was successfully created"
    click_on "Back"
  end

  test "should update Grader" do
    visit grader_url(@grader)
    click_on "Edit this grader", match: :first

    fill_in "Email", with: @grader.email
    fill_in "Fname", with: @grader.fname
    fill_in "Lname", with: @grader.lname
    click_on "Update Grader"

    assert_text "Grader was successfully updated"
    click_on "Back"
  end

  test "should destroy Grader" do
    visit grader_url(@grader)
    click_on "Destroy this grader", match: :first

    assert_text "Grader was successfully destroyed"
  end
end
