class MenuController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    @results = Product.where("name LIKE ?", "%#{params[:term]}%")
    if params[:filter] == '--Filter--'
      respond_to do |format|
        format.js { render partial: 'results' }
      end
    else
      filter = params[:filter].gsub(/ /, '_').downcase!.to_sym
      @results = @results << Product.where(filter: true)
      respond_to do |format|
        format.js { render partial: 'results' }
      end
    end
  end
end
