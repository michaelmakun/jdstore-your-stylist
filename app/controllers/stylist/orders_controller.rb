class Stylist::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_stylist

  def index
    @products = current_user.products
    @products.each do |product|
      # if current_user.id == product.user_id
        @orders = product.orders
      # end
    end
    # @orders += product.orders
    # @orders = current_user.orders
    # @product = @order.products.find_by(order_id: params[:order_id])
    # if current_user.id == @product.user_id
    # @orders = current_user.orders.order("id DESC")
    # end
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end
end
