class Admin::OrdersController < ApplicationController
  def index

  end

  def show

    @order = Order.find(params[:id])
   

  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:order_price,:payment_method,:status)
  end
end
