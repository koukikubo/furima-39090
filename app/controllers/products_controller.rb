class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.all
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

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                    :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
