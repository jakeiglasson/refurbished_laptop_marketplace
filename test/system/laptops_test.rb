require "application_system_test_case"

class LaptopsTest < ApplicationSystemTestCase
  setup do
    @laptop = laptops(:one)
  end

  test "visiting the index" do
    visit laptops_url
    assert_selector "h1", text: "Laptops"
  end

  test "creating a Laptop" do
    visit laptops_url
    click_on "New Laptop"

    fill_in "Brand", with: @laptop.brand_id
    fill_in "Cpu", with: @laptop.cpu_id
    fill_in "Grade", with: @laptop.grade
    fill_in "Hard drive", with: @laptop.hard_drive_id
    fill_in "Model", with: @laptop.model
    fill_in "Price", with: @laptop.price
    fill_in "Ram", with: @laptop.ram_id
    fill_in "Sold status", with: @laptop.sold_status
    fill_in "User", with: @laptop.user_id
    click_on "Create Laptop"

    assert_text "Laptop was successfully created"
    click_on "Back"
  end

  test "updating a Laptop" do
    visit laptops_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @laptop.brand_id
    fill_in "Cpu", with: @laptop.cpu_id
    fill_in "Grade", with: @laptop.grade
    fill_in "Hard drive", with: @laptop.hard_drive_id
    fill_in "Model", with: @laptop.model
    fill_in "Price", with: @laptop.price
    fill_in "Ram", with: @laptop.ram_id
    fill_in "Sold status", with: @laptop.sold_status
    fill_in "User", with: @laptop.user_id
    click_on "Update Laptop"

    assert_text "Laptop was successfully updated"
    click_on "Back"
  end

  test "destroying a Laptop" do
    visit laptops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Laptop was successfully destroyed"
  end
end