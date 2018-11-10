require 'test_helper'

class InstsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get insts_index_url
    assert_response :success
  end

end
