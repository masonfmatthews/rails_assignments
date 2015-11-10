require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "show individual candidate" do
    get :show, id:candidates(:trump).id

    assert_response :success
    assert response.body.include?("Trump")
    refute response.body.include?("Hilary")
  end

end
