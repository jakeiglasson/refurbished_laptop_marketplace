require 'application_system_test_case'

class LaptopBrandsTest < ApplicationSystemTestCase
  setup do
    @laptop_brand = laptop_brands(:one)
  end

  test 'visiting the index' do
    visit laptop_brands_url
    assert_selector 'h1', text: 'Laptop Brands'
  end

  test 'creating a Laptop brand' do
    visit laptop_brands_url
    click_on 'New Laptop Brand'

    fill_in 'Name', with: @laptop_brand.name
    click_on 'Create Laptop brand'

    assert_text 'Laptop brand was successfully created'
    click_on 'Back'
  end

  test 'updating a Laptop brand' do
    visit laptop_brands_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @laptop_brand.name
    click_on 'Update Laptop brand'

    assert_text 'Laptop brand was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Laptop brand' do
    visit laptop_brands_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Laptop brand was successfully destroyed'
  end
end
