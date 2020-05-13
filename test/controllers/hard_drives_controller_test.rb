require 'test_helper'

class HardDrivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hard_drife = hard_drives(:one)
  end

  test "should get index" do
    get hard_drives_url
    assert_response :success
  end

  test "should get new" do
    get new_hard_drife_url
    assert_response :success
  end

  test "should create hard_drife" do
    assert_difference('HardDrive.count') do
      post hard_drives_url, params: { hard_drife: { name: @hard_drife.name } }
    end

    assert_redirected_to hard_drife_url(HardDrive.last)
  end

  test "should show hard_drife" do
    get hard_drife_url(@hard_drife)
    assert_response :success
  end

  test "should get edit" do
    get edit_hard_drife_url(@hard_drife)
    assert_response :success
  end

  test "should update hard_drife" do
    patch hard_drife_url(@hard_drife), params: { hard_drife: { name: @hard_drife.name } }
    assert_redirected_to hard_drife_url(@hard_drife)
  end

  test "should destroy hard_drife" do
    assert_difference('HardDrive.count', -1) do
      delete hard_drife_url(@hard_drife)
    end

    assert_redirected_to hard_drives_url
  end
end
