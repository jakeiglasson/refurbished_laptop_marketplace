require "application_system_test_case"

class LaptopOrdersTest < ApplicationSystemTestCase
  setup do
    @laptop_order = laptop_orders(:one)
  end

  test "visiting the index" do
    visit laptop_orders_url
    assert_selector "h1", text: "Laptop Orders"
  end

  test "creating a Laptop order" do
    visit laptop_orders_url
    click_on "New Laptop Order"

    fill_in "Laptop", with: @laptop_order.laptop_id
    fill_in "User", with: @laptop_order.user_id
    click_on "Create Laptop order"

    assert_text "Laptop order was successfully created"
    click_on "Back"
  end

  test "updating a Laptop order" do
    visit laptop_orders_url
    click_on "Edit", match: :first

    fill_in "Laptop", with: @laptop_order.laptop_id
    fill_in "User", with: @laptop_order.user_id
    click_on "Update Laptop order"

    assert_text "Laptop order was successfully updated"
    click_on "Back"
  end

  test "destroying a Laptop order" do
    visit laptop_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Laptop order was successfully destroyed"
  end
end
