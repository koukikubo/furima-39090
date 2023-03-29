class ProductsController < ApplicationController
  before_action :set_products,  only: [:show, :edit ,:update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]
  

  def index
    @products = Product.includes(:user).order("created_at DESC")

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end
  def  destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  
  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                    :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def correct_user
    @user = @product.user
    redirect_to(root_path) unless @user == current_user
  end

  
end
