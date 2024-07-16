require "test_helper"

class GradersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grader = graders(:one)
  end

  test "should get index" do
    get graders_url
    assert_response :success
  end

  test "should get new" do
    get new_grader_url
    assert_response :success
  end

  test "should create grader" do
    assert_difference("Grader.count") do
      post graders_url, params: { grader: { email: @grader.email, fname: @grader.fname, lname: @grader.lname } }
    end

    assert_redirected_to grader_url(Grader.last)
  end

  test "should show grader" do
    get grader_url(@grader)
    assert_response :success
  end

  test "should get edit" do
    get edit_grader_url(@grader)
    assert_response :success
  end

  test "should update grader" do
    patch grader_url(@grader), params: { grader: { email: @grader.email, fname: @grader.fname, lname: @grader.lname } }
    assert_redirected_to grader_url(@grader)
  end

  test "should destroy grader" do
    assert_difference("Grader.count", -1) do
      delete grader_url(@grader)
    end

    assert_redirected_to graders_url
  end
end
