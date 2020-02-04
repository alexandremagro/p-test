require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'must have phone model and imei' do
    order = Order.new
    order.valid?

    assert_includes order.errors[:phone_model], "can't be blank"
    assert_includes order.errors[:phone_imei], "can't be blank"
  end

  test 'must have installment amount and number of installments' do
    order = Order.new
    order.valid?

    assert_includes order.errors[:installment_amount], "can't be blank"
    assert_includes order.errors[:number_of_installments], "can't be blank"
  end
end
