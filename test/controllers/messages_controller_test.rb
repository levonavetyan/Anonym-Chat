require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get messages_create_url
    assert_response :success
  end

  test "should get msg_params" do
    get messages_msg_params_url
    assert_response :success
  end

end
