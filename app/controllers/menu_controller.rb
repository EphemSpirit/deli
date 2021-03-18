class MenuController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    @results = Product.where("name LIKE ?", "%#{params[:search][:term]}%")
    if params[:search][:filter] == '--Filter--'
      respond_to do |format|
        format.js { render partial: 'results' }
      end
    else
      filter = params[:search][:filter].gsub(/ /, '_').downcase.to_sym
      @results = @results.where(filter => true)
      respond_to do |format|
        format.js { render partial: 'results' }
      end
    end
  end
end
