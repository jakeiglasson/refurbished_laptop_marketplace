require 'test_helper'

class LaptopBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laptop_brand = laptop_brands(:one)
  end

  test "should get index" do
    get laptop_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_laptop_brand_url
    assert_response :success
  end

  test "should create laptop_brand" do
    assert_difference('LaptopBrand.count') do
      post laptop_brands_url, params: { laptop_brand: { name: @laptop_brand.name } }
    end

    assert_redirected_to laptop_brand_url(LaptopBrand.last)
  end

  test "should show laptop_brand" do
    get laptop_brand_url(@laptop_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_laptop_brand_url(@laptop_brand)
    assert_response :success
  end

  test "should update laptop_brand" do
    patch laptop_brand_url(@laptop_brand), params: { laptop_brand: { name: @laptop_brand.name } }
    assert_redirected_to laptop_brand_url(@laptop_brand)
  end

  test "should destroy laptop_brand" do
    assert_difference('LaptopBrand.count', -1) do
      delete laptop_brand_url(@laptop_brand)
    end

    assert_redirected_to laptop_brands_url
  end
end
