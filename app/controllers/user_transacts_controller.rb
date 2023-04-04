class UserTransactsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @product = Product.find(params[:product_id])
    @purchase = Purchase.new
    if current_user == @product.user || @product.user_transact != nil
        redirect_to root_path
    end
  end
  def create
    
    @product = Product.find(params[:product_id])
    @purchase = Purchase.new(purchase_params)
    
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :city_name, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
