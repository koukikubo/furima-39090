class Purchase

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city_name, :address, :building_name, :phone_number , :product_id, :user_id

  validates :prefecture_id, numericality: {other_than: 1}

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :address, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
  end

  def save
    
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, purchase_id: purchase.id)
  end
end
