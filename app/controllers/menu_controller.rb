class MenuController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    @results = Product.where()
  end
end
