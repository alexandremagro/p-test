class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:user).all
  end

  def new
    @new_order = Order.new
    @new_order.build_user
  end
end
