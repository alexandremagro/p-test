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
end
