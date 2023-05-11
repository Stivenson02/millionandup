class Product::CategoriesController < ApplicationController
  before_action :set_product_category, only: %i[ show edit update destroy ]

  # GET /product/categories or /product/categories.json
  def index
    @product_categories = Category.all.sort_by { |c| c.updated_at }.reverse
  end

  # GET /product/categories/1 or /product/categories/1.json
  def show
  end

  # GET /product/categories/new
  def new
    @product_category = Category.new
  end

  # GET /product/categories/1/edit
  def edit
  end

  # POST /product/categories or /product/categories.json
  def create

    @product_category = Category.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        Historical.create(admin: current_admin, movement: @product_category)
        format.html { redirect_to product_category_url(@product_category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product/categories/1 or /product/categories/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        Historical.create(admin: current_admin, movement: @product_category, change: :edit)
        format.html { redirect_to product_category_url(@product_category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product/categories/1 or /product/categories/1.json
  def destroy
    @product_category.destroy

    respond_to do |format|
      format.html { redirect_to product_categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_category_params
      params.permit(:name)
    end
end
