class Admin::MenuController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_item, only: %i[create edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if @product.save(product_attributes)
      redirect_to @product
    else
      flash[:notice] = "Something went wrong, please review the form and try again"
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to @product
    else
      flash[:notice] = "Something went wrong, pplease review the form and try again"
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product removed from the menu"
    redirect_to 'admin/menu'
  end

  private

    def find_item
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :vegan, :vegetarian, :dairy_free, :nut_free, :available)
    end
end
