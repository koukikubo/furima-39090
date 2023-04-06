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
        expect(@purchase).to_not be_valid
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.post_code = '1234567'
        expect(@purchase).to_not be_valid
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase.prefecture_id = 1
        expect(@purchase).to_not be_valid
      end
      it '市区町村が空だと保存できないこと' do
        @purchase.city_name = ''
        expect(@purchase).to_not be_valid
      end
      it '番地が空だと保存できないこと' do
        @purchase.address = ''
        expect(@purchase).to_not be_valid
      end
      it '電話番号が空だと保存できないこと' do
        @purchase.phone_number = ''
        expect(@purchase).to_not be_valid
      end
      it '電話番号は、12桁以上だと保存できないこと' do
        @purchase.phone_number = '090-1234-567899'
        expect(@purchase).to_not be_valid
      end
      it '電話番号は、9桁以下だと保存できないこと' do
        @purchase.phone_number = '090-1234-5'
        expect(@purchase).to_not be_valid
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @purchase.phone_number = '０9012341234'
        expect(@purchase).to_not be_valid
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase.user_id = nil
        expect(@purchase).to_not be_valid
      end
      it 'product_idが紐づいていなければ購入できないこと' do
        @purchase.product_id = ''
        expect(@purchase).to_not be_valid
      end
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        expect(@purchase).to_not be_valid
      end
    end
  end
end
