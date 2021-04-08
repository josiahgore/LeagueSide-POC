require "test_helper"

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leagues_index_url
    assert_response :success
  end

  test "should get new" do
    get leagues_new_url
    assert_response :success
  end

  test "should get find" do
    get leagues_find_url
    assert_response :success
  end
end
