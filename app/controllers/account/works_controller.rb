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
    if @work.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @work = Work.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @work = Work.find(params[:id])
    @work.product_id = @product.id
    if @work.update(work_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to @product
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :image)
  end
end
