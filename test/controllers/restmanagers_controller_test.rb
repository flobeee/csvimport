require 'test_helper'

class RestmanagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restmanagers_index_url
    assert_response :success
  end

  test "should get import" do
    get restmanagers_import_url
    assert_response :success
  end

  test "should get update" do
    get restmanagers_update_url
    assert_response :success
  end

  test "should get create" do
    get restmanagers_create_url
    assert_response :success
  end

end
