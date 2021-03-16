class MenuController < ApplicationController
  def index
    @products = Product.all
  end

  def search

  end
end
