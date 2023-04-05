class Purchase
  
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city_name, :address, :building_name, :phone_number , :product_id, :user_id, :token
  
  validates :prefecture_id, numericality: {other_than: 1}

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :city_name
    validates :address
    validates :token
  end

  def save
    
    user_transact = UserTransact.create(product_id: product_id, user_id: user_id)
    
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, phone_number:phone_number, user_transact_id: user_transact.id)
  end
end
