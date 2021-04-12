require "test_helper"

class LeaguesControllerTest < ActionDispatch::IntegrationTest

  test "should post create" do
    post '/leagues/create.json', params: {
      name: 'Test League',
      latitude: 1.23232,
      longitude: 2.34324,
      price_cents: 1234,
    }
    assert_response :success
  end

  test "post create without required attributes" do
    post '/leagues/create.json', params: {
      latitude: 1.23232,
      longitude: 2.34324,
      price_cents: 1234,
    }
    assert_response :unprocessable_entity
    post '/leagues/create.json', params: {
      name: 'Test League',
      longitude: 2.34324,
      price_cents: 1234,
    }
    assert_response :unprocessable_entity
    post '/leagues/create.json', params: {
      name: 'Test League',
      latitude: 1.23232,
      price_cents: 1234,
    }
    assert_response :unprocessable_entity
    post '/leagues/create.json', params: {
      name: 'Test League',
      latitude: 1.23232,
      longitude: 2.34324,
    }
    assert_response :unprocessable_entity
  end

  test "should get find" do
    League.create({
      name: 'Crowder Park',
      latitude: 35.695609323728185,
      longitude: -78.7652869836795,
      price_cents: 15000,
    })

    get '/leagues/find.json', params: {
      latitude: 35.647052676093885,
      longitude: -78.8276968727421,
      radius: 5,
      price_cents: 17500,
    }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal 1, json_response['leagues'].length

    get '/leagues/find.json', params: {
      latitude: 35.647052676093885,
      longitude: -78.8276968727421,
      radius: 5,
      price_cents: 14500,
    }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal 0, json_response['leagues'].length

    get '/leagues/find.json', params: {
      latitude: 35.647052676093885,
      longitude: -78.8276968727421,
      radius: 1,
      price_cents: 17500,
    }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal 0, json_response['leagues'].length

  end

end
