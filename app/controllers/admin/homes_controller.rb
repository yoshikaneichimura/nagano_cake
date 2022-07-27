class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all

  end

  private

  def order_params
   params.require(:order).permit(:customer_id,address,:name,:order_price,:payment_method)
  end

end




