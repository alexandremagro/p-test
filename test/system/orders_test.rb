require 'application_system_test_case'

class OrdersTest < ApplicationSystemTestCase
  # index

  test 'should get index' do
    visit root_url

    within(Selectors::MAIN_CONTENT) do
      assert_selector Selectors::HEADER, text: orders(:luke_order).phone_imei
      assert_selector Selectors::HEADER, text: orders(:leia_order).phone_imei
    end
  end

  # new

  test 'should create an order' do
    visit_new_order

    assert_difference 'Order.count' do
      fill_in 'Cpf', with: 1000
      fill_in 'Email', with: 'johndoe@email.com'
      fill_in 'Name', with: 'John Doe'
      fill_in 'Phone model', with: 'iPhone 230'
      fill_in 'Phone imei', with: 1000
      fill_in 'Installment amount', with: 50
      fill_in 'Number of installments', with: 6
      click_button 'Create Order'

      assert_current_path root_path
    end
  end

  test 'should not create an order with errors' do
    visit_new_order

    assert_no_difference 'Order.count' do
      click_button 'Create Order'

      assert_selector Selectors::INVALID_FORM_GROUP, text: "Cpf\ncan't be blank"
      assert_selector Selectors::INVALID_FORM_GROUP, text: "Email\ncan't be blank"
      assert_selector Selectors::INVALID_FORM_GROUP, text: "Name\ncan't be blank"
      assert_selector Selectors::INVALID_FORM_GROUP, text: "Phone model\ncan't be blank"
      assert_selector Selectors::INVALID_FORM_GROUP, text: "Phone imei\ncan't be blank"
      assert_selector Selectors::INVALID_FORM_GROUP, text: "Installment amount\ncan't be blank"
      assert_selector Selectors::INVALID_FORM_GROUP, text: "Number of installments\ncan't be blank"
    end
  end

  private

  def visit_new_order
    visit root_url

    within(Selectors::TITLEBAR) do
      click_link 'New order'
    end
  end
end
