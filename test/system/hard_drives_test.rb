require "application_system_test_case"

class HardDrivesTest < ApplicationSystemTestCase
  setup do
    @hard_drive = hard_drives(:one)
  end

  test "visiting the index" do
    visit hard_drives_url
    assert_selector "h1", text: "Hard Drives"
  end

  test "creating a Hard drive" do
    visit hard_drives_url
    click_on "New Hard Drive"

    fill_in "Name", with: @hard_drive.name
    click_on "Create Hard drive"

    assert_text "Hard drive was successfully created"
    click_on "Back"
  end

  test "updating a Hard drive" do
    visit hard_drives_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hard_drive.name
    click_on "Update Hard drive"

    assert_text "Hard drive was successfully updated"
    click_on "Back"
  end

  test "destroying a Hard drive" do
    visit hard_drives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hard drive was successfully destroyed"
  end
end
