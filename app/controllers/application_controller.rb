class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :image, :nickname, :is_stylist) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :image, :nickname, :description) }
  end
end
