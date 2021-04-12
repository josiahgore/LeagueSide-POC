require "test_helper"

class LeaguesControllerTest < ActionDispatch::IntegrationTest

  test "should post create" do
    post leagues_create_url, params: {
      name: 'Test League',
      latitude: 1.23232,
      longitude: 2.34324,
      price_cents: 1234,
    }
    assert_response :success
  end

  test "post create without required attributes" do
    post leagues_create_url, params: {
      latitude: 1.23232,
      longitude: 2.34324,
      price_cents: 1234,
    }
    assert_response :unprocessable_entity
    post leagues_create_url, params: {
      name: 'Test League',
      longitude: 2.34324,
      price_cents: 1234,
    }
    assert_response :unprocessable_entity
    post leagues_create_url, params: {
      name: 'Test League',
      latitude: 1.23232,
      price_cents: 1234,
    }
    assert_response :unprocessable_entity
    post leagues_create_url, params: {
      name: 'Test League',
      latitude: 1.23232,
      longitude: 2.34324,
    }
    assert_response :unprocessable_entity
  end

  test "should get find" do
    get leagues_find_url
    assert_response :success
  end

end
