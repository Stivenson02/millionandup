class Product::CategoriesController < ApplicationController
  before_action :set_product_category, only: %i[ show edit update ]

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
        format.html { redirect_to product_category_url(@product_category), notice: { message: "Category was successfully created.", status: true } }
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
        format.html { redirect_to product_category_url(@product_category), notice: { message: "Category was successfully updated.", status: true } }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE category of Product Categories
  def destroy
    product_category = Product::Category.find(params[:id])
    product_product = product_category.product
    product_category.destroy

    respond_to do |format|
      Historical.create(admin: current_admin, movement: product_product, change: :remove_category_of_product)
      Historical.create(admin: current_admin, movement: product_category, change: :remove_category_of_product)

      format.html { redirect_to product_product_url(product_product), notice: { message: "Category Delete of Product", status: true } }
      format.json { render :show, status: :ok, location: product_product }
    end
  end

  def add_product_categories
    product = Product.find(params[:id])
    category_id = params[:category_id]
    respond_to do |format|
      if !category_id.empty?
        category = Category.find(category_id)
        Product::Category.create(category: category, product: product)
        Historical.create(admin: current_admin, movement: product, change: :added_category_of_product)
        Historical.create(admin: current_admin, movement: category, change: :added_category_of_product)
        format.html { redirect_to product_product_url(product), notice: { message: "Product was successfully created.", status: true } }
        format.json { render :show, status: :created, location: product }
      else
        format.html { redirect_to product_product_url(product), notice: { message: "Selected a Category, Please", status: false } }
        format.json { render :show, status: :unprocessable_entity, location: product }
      end
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
