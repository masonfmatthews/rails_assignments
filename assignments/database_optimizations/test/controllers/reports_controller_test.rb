require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get all_data" do
    get :all_data
    assert_response :success
  end

end
