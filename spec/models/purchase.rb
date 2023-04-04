require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '配送先の保存' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @purchase = FactoryBot.build(:purchase, user_id: @user.id, product_id: @product.id)
    end
  
    context '内容に問題ない場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase.city_name = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City name can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @purchase.phone_number = '０9012341234'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが紐づいていなければ購入できないこと' do
        @purchase.product_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Product can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
