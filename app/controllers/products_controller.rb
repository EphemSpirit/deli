class ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @dishes = Product.all
  end
end
