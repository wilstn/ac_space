require 'test_helper'

class JstimersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jstimer = jstimers(:one)
  end

  test "should get index" do
    get jstimers_url
    assert_response :success
  end

  test "should get new" do
    get new_jstimer_url
    assert_response :success
  end

  test "should create jstimer" do
    assert_difference('Jstimer.count') do
      post jstimers_url, params: { jstimer: {  } }
    end

    assert_redirected_to jstimer_url(Jstimer.last)
  end

  test "should show jstimer" do
    get jstimer_url(@jstimer)
    assert_response :success
  end

  test "should get edit" do
    get edit_jstimer_url(@jstimer)
    assert_response :success
  end

  test "should update jstimer" do
    patch jstimer_url(@jstimer), params: { jstimer: {  } }
    assert_redirected_to jstimer_url(@jstimer)
  end

  test "should destroy jstimer" do
    assert_difference('Jstimer.count', -1) do
      delete jstimer_url(@jstimer)
    end

    assert_redirected_to jstimers_url
  end
end
