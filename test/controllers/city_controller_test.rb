require 'test_helper'

class CityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get city_index_url
    assert_response :success
  end

  test "should get show" do
    get city_show_url
    assert_response :success
  end

  test "should get new" do
    get city_new_url
    assert_response :success
  end

  test "should get edit" do
    get city_edit_url
    assert_response :success
  end

  test "should get create" do
    get city_create_url
    assert_response :success
  end

  test "should get update" do
    get city_update_url
    assert_response :success
  end

  test "should get destroy" do
    get city_destroy_url
    assert_response :success
  end

end
