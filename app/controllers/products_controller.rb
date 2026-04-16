class ProductsController < ApplicationController
  def index
    @products = Product.all 
  end

  def show
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 
    def product_params
      params.expect(product: [ :name ])
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
