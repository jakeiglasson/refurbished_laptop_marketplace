require 'test_helper'

class LaptopOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laptop_order = laptop_orders(:one)
  end

  test 'should get index' do
    get laptop_orders_url
    assert_response :success
  end

  test 'should get new' do
    get new_laptop_order_url
    assert_response :success
  end

  test 'should create laptop_order' do
    assert_difference('LaptopOrder.count') do
      post laptop_orders_url, params: { laptop_order: { laptop_id: @laptop_order.laptop_id, user_id: @laptop_order.user_id } }
    end

    assert_redirected_to laptop_order_url(LaptopOrder.last)
  end

  test 'should show laptop_order' do
    get laptop_order_url(@laptop_order)
    assert_response :success
  end

  test 'should get edit' do
    get edit_laptop_order_url(@laptop_order)
    assert_response :success
  end

  test 'should update laptop_order' do
    patch laptop_order_url(@laptop_order), params: { laptop_order: { laptop_id: @laptop_order.laptop_id, user_id: @laptop_order.user_id } }
    assert_redirected_to laptop_order_url(@laptop_order)
  end

  test 'should destroy laptop_order' do
    assert_difference('LaptopOrder.count', -1) do
      delete laptop_order_url(@laptop_order)
    end

    assert_redirected_to laptop_orders_url
  end
end
