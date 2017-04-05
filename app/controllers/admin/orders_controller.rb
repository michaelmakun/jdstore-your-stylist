class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_order, only: [:show, :ship, :shipped, :return, :cancel]
  layout 'admin'

  def index
    @orders = Order.all.order("id DESC")
  end

  def show
    @product_lists = @order.product_lists
  end

  def ship
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def return
    @order.return_good!
    redirect_to :back
  end

  def cancel
    @order.cancel_order!
    redirect_to :back
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
