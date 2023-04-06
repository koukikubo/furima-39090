require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('spec/factories/enru.png')
  end

  describe '出品機能' do
    context '出品ができる時' do
      it '必須項目が全てあれば登録できること' do
        expect(@product).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @product = FactoryBot.create(:user)
        expect(@product).to be_valid
      end
    end

    context '出品ができない時' do
      it 'imageが空では登録できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '商品名が必須であること' do
        @product.name = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '商品の説明が必須であること' do
        @product.description = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it 'カテゴリーの情報が必須であること' do
        @product.category_id = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '商品の状態についての情報が必須であること' do
        @product.status_id = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '配送料の負担についての情報が必須であること' do
        @product.shipping_cost_id = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '発送元の地域についての情報が必須であること' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '発送までの日数についての情報が必須であること' do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '販売価格についての情報が必須であること' do
        @product.price = ''
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = '100'
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = '１００００'
        @product.valid?
        expect(@product).to_not be_valid
      end
      it '販売価格が半角数字以外がある場合出品できない' do
        @product.price = 'aあ亜S０カ'
        @product.valid?
        expect(@product).to_not be_valid
      end
      it 'userが紐付いていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product).to_not be_valid
      end

      it 'カテゴリーが未選択だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product).to_not be_valid
      end

      it 'ステータスが未選択だと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '配送料が未選択だと出品できない' do
        @product.shipping_cost_id = 1
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '発送元地域が未選択だと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product).to_not be_valid
      end

      it '発送までの日数が未選択だと出品できない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product).to_not be_valid
      end
    end
  end
end
