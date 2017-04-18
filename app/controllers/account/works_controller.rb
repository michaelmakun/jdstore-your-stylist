class Account::WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :require_stylist

  def index
    @product = Product.find(params[:product_id])
    @works = @product.works.all
  end

  def new
    @product = Product.find(params[:product_id])
    @work = Work.new
  end

  def create
    @product = Product.find(params[:product_id])

    @work = Work.new(work_params)
    @work.product_id = @product.id
    if @work.save
      redirect_to account_products_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @work = Work.find(params[:id])
    @work.product_id = @product.id
  end

  def update
    @product = Product.find(params[:product_id])
    @work = Work.find(params[:id])
    @work.product_id = @product.id
    if @work.update(work_params)
      redirect_to account_product_path(@product), notice: "作品更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to account_product_path(@product), alert: "作品删除成功！"
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :image)
  end
end
