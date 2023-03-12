class Products::ProductsController < ApplicationController

  def index
    binding.pry
  end

  def show
    binding.pry
    @products = []
    respond_to do |format|
      format.json { redirect_to root_path json: @products }
      format.html { redirect_to root_path notice: "Filtro" }
    end
  end

end