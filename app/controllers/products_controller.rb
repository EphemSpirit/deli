class ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_product, only: %i[show edit update destroy]

  def index
    @products = Product.all.order(:id)
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Menu item added!"
      redirect_to @product
    else
      flash[:alert] = "Something went wrong. Please review the form and try again"
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      flash[:notice] = "Menu item updated!"
      redirect_to @product
    else
      flash[:alert] = "Something went wrong, please review the form and try again"
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Menu item deleted"
    redirect_to products_path
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :image, :description, :vegan, :vegetarian, :nut_free, :dairy_free, :available)
    end
end
