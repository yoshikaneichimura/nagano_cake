class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:order_price,:payment_method,:status)
  end
end
