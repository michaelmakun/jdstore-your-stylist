class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_admin
    if !current_user.admin?
      flash[:alert] = "你不是管理员"
      redirect_to root_path
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    # if current_user
    #   session[:cart_id] = current_user.id
    # else
      session[:cart_id] = cart.id
    # end
    return cart
  end
end
