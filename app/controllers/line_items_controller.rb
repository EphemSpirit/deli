class LineItemsController < ApplicationController
  include CurrentCart
  before_action :find_item, only: %i[show edit update destroy]
  before_action :set_cart, only: [:create]

  def index
    @line_items = LineItem.all
  end

  def new
    @line_item = LineItem.new
  end

  def show

  end

  def create
    product = Product.find(params[:id])
    @line_item = @cart.add_product(product)

    if @line_item.save
      redirect_to @line_item.cart
      flash[:notice] = "Item added to cart!"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item
    else
      render :edit
    end
  end

  def destroy
    @cart = Cart.find_by(session[:cart_id])
    @line_item.destroy
    redirect_to @cart
  end

  private

    def find_item
      @line_item = LineItem.find(params[:product_id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
