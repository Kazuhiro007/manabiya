require 'test_helper'

class ParticipatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get participates_index_url
    assert_response :success
  end

end
