class Account::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_stylist

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @works = @product.works.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to account_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    if @product.user != current_user
      redirect_to account_products_path, alert: "You have no permission"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.user != current_user
      redirect_to account_products_path, alert: "You have no permission"
    end

    if @product.update(product_params)
      redirect_to account_products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user != current_user
      redirect_to account_products_path, alert: "You have no permission"
    end
    @product.destroy
    redirect_to account_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title,:description, :price, :image, :quantity)
  end
end
