require 'test_helper'

class HardDrivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hard_drive = hard_drives(:one)
  end

  test "should get index" do
    get hard_drives_url
    assert_response :success
  end

  test "should get new" do
    get new_hard_drive_url
    assert_response :success
  end

  test "should create hard_drive" do
    assert_difference('HardDrive.count') do
      post hard_drives_url, params: { hard_drive: { name: @hard_drive.name } }
    end

    assert_redirected_to hard_drive_url(HardDrive.last)
  end

  test "should show hard_drive" do
    get hard_drive_url(@hard_drive)
    assert_response :success
  end

  test "should get edit" do
    get edit_hard_drive_url(@hard_drive)
    assert_response :success
  end

  test "should update hard_drive" do
    patch hard_drive_url(@hard_drive), params: { hard_drive: { name: @hard_drive.name } }
    assert_redirected_to hard_drive_url(@hard_drive)
  end

  test "should destroy hard_drive" do
    assert_difference('HardDrive.count', -1) do
      delete hard_drive_url(@hard_drive)
    end

    assert_redirected_to hard_drives_url
  end
end
