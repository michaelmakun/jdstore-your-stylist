class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  layout 'admin'

  def index
    @orders = Order.all.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
end
