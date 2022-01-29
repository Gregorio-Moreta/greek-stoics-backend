require "test_helper"

class GreeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greek = greeks(:one)
  end

  test "should get index" do
    get greeks_url, as: :json
    assert_response :success
  end

  test "should create greek" do
    assert_difference('Greek.count') do
      post greeks_url, params: { greek: { author: @greek.author, message: @greek.message } }, as: :json
    end

    assert_response 201
  end

  test "should show greek" do
    get greek_url(@greek), as: :json
    assert_response :success
  end

  test "should update greek" do
    patch greek_url(@greek), params: { greek: { author: @greek.author, message: @greek.message } }, as: :json
    assert_response 200
  end

  test "should destroy greek" do
    assert_difference('Greek.count', -1) do
      delete greek_url(@greek), as: :json
    end

    assert_response 204
  end
end
