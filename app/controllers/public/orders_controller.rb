class Public::OrdersController < ApplicationController
  def new
    @orders = Order.new
    @customer = current_customer
  end

  def comfirm
    @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    else
      @orders = Order.all
    end

    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |subtotal, item| subtotal + item.subtotal }
    @order.shipping_cost = 800
    @order.order_price = @total + 800
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |subtotal, item| subtotal + item.subtotal }
    @order.shipping_cost = 800
    @order.order_price = @total + 800



    @order.save

    @cart_items.each do |cart_item|

      @order_deail = OrderDetail.new
      @order_deail.order_id = @order.id
      @order_deail.item_id = cart_item.item_id
      @order_deail.price = cart_item.item.price
      @order_deail.amount = cart_item.amount
      @order_deail.save
      end

     @cart_items.destroy_all
     redirect_to public_orders_complete_path
  end



  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:order_price,:payment_method,:status)
  end
end
