class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:alert] = "清空购物车！！"
    redirect_back(fallback_location: carts_path)
  end

  def checkout
    @order = Order.new
  end
end
