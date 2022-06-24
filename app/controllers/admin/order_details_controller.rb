class Admin::OrderDetailsController < ApplicationController
  def show
    @order_details = Order_detail.find(params[:id])
  end

  def destroy
  end
  
  private
  
  def order_details_params
    params.require(:order_details).permit(:order_id,:item_id,:price,:amount,:making_status,)
  end
    
end
