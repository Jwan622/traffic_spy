require_relative 'controller_test_helper'

class ServerControllerTest < Minitest::Test
   include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_server_can_register_a_client_with_200_status
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
  end

  def test_it_returns_a_400_status_and_error_message_with_missing_params
    post '/sources', 'identifier=jumpstartlab'
    assert_equal 400, last_response.status

    post '/sources', 'rootUrl=http://jumpstartlab.com'
    assert_equal 400, last_response.status
    assert_equal "Missing Parameter(s)", last_response.body

  end
end
