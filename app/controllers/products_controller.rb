class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @product = Product.new
  end
  def create
    @product = Product.new product_params
    @product.user = current_user

    if @product.save
      ProductMailer.new_product_notify(@product).deliver_now
      redirect_to product_path(@product), notice: 'Product created!'
    else
      flash[:alert] = "uuuuuuuuuuuuuuuuuuuuu"
      render :new

    end
  end


  def show
    @product = Product.find params[:id]
    @review = Review.new
    # render json: params
  end
  def index
    @product = Product.last(50)
  end
  def edit
    @product = Product.find params[:id]
  end
  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :description, :price])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to products_path

  end

  private
  def find_product
    @product = Product.find params[:id]
  end
  def product_params
    params.require(:product).permit([:title, :description, :price, :category_id])
  end
end
