class Api::OrdersController < ApiController
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :phone_model,
      :phone_imei,
      :installment_amount,
      :number_of_installments,
      user_attributes: %i[name cpf email]
    )
  end
end
