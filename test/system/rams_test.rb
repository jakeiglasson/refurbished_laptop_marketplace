require "application_system_test_case"

class RamsTest < ApplicationSystemTestCase
  setup do
    @ram = rams(:one)
  end

  test "visiting the index" do
    visit rams_url
    assert_selector "h1", text: "Rams"
  end

  test "creating a Ram" do
    visit rams_url
    click_on "New Ram"

    fill_in "Name", with: @ram.name
    click_on "Create Ram"

    assert_text "Ram was successfully created"
    click_on "Back"
  end

  test "updating a Ram" do
    visit rams_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ram.name
    click_on "Update Ram"

    assert_text "Ram was successfully updated"
    click_on "Back"
  end

  test "destroying a Ram" do
    visit rams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ram was successfully destroyed"
  end
end
