require 'test_helper'

class Api::OrdersControllerTest < ActionDispatch::IntegrationTest
  # create

  test 'should create order' do
    order = {
      phone_model: 'iPhone 11',
      phone_imei: ('0' * 14) + '1',
      installment_amount: 1000.0,
      number_of_installments: 6,
      user_attributes: {
        name: 'John Doe',
        cpf: ('0' * 10) + '1',
        email: 'john@email.com'
      }
    }

    assert_difference 'Order.count' do
      post api_orders_path, params: { order: order }

      assert_response :created
      assert_equal @response.parsed_body, Order.last.as_json
    end
  end

  test 'should not create order without an user' do
    assert_no_difference 'Order.count' do
      post api_orders_path, params: {
        order: {
          phone_model: 'iPhone 11',
          phone_imei: ('0' * 14) + '1',
          installment_amount: 1000.0,
          number_of_installments: 6
        }
      }

      assert_response :unprocessable_entity
      assert_includes @response.parsed_body['user'], 'must exist'
    end
  end

  test 'should not create order with wrong user' do
    assert_no_difference 'Order.count' do
      post api_orders_path, params: {
        order: {
          phone_model: 'iPhone 11',
          phone_imei: ('0' * 14) + '1',
          installment_amount: 1000.0,
          number_of_installments: 6,
          user_attributes: {
            name: nil,
            email: nil,
            cpf: nil
          }
        }
      }

      assert_response :unprocessable_entity
      assert_includes @response.parsed_body['user.name'], "can't be blank"
      assert_includes @response.parsed_body['user.email'], "can't be blank"
      assert_includes @response.parsed_body['user.cpf'], "can't be blank"
    end
  end
end
