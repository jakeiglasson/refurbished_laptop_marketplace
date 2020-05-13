require "application_system_test_case"

class CpusTest < ApplicationSystemTestCase
  setup do
    @cpu = cpus(:one)
  end

  test "visiting the index" do
    visit cpus_url
    assert_selector "h1", text: "Cpus"
  end

  test "creating a Cpu" do
    visit cpus_url
    click_on "New Cpu"

    fill_in "Name", with: @cpu.name
    click_on "Create Cpu"

    assert_text "Cpu was successfully created"
    click_on "Back"
  end

  test "updating a Cpu" do
    visit cpus_url
    click_on "Edit", match: :first

    fill_in "Name", with: @cpu.name
    click_on "Update Cpu"

    assert_text "Cpu was successfully updated"
    click_on "Back"
  end

  test "destroying a Cpu" do
    visit cpus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cpu was successfully destroyed"
  end
end
