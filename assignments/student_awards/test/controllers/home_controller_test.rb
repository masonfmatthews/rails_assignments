require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get show_everything" do
    get :show_everything
    assert_response :success
  end

  test "should get add_award" do
    get :add_award
    assert_response :success
  end

  test "should get show_teacher" do
    get :show_teacher
    assert_response :success
  end

  test "should get show_student" do
    get :show_student
    assert_response :success
  end

  test "should get remove_award" do
    get :remove_award
    assert_response :success
  end

  test "should get add_student" do
    get :add_student
    assert_response :success
  end

  test "should get add_teacher" do
    get :add_teacher
    assert_response :success
  end

end
