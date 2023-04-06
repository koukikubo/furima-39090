require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全てのカラムがあれば正常に登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        expect(@user).to_not be_valid
      end
      it 'familynameが空では登録できない' do
        @user.family_name = ''
        expect(@user).to_not be_valid
      end
      it 'familyname_kanaが空では登録できない' do
        @user.family_name_kana = ''
        expect(@user).to_not be_valid
      end
      it 'firstnameが空では登録できない' do
        @user.first_name = ''
        expect(@user).to_not be_valid
      end
      it 'firstname_kanaが空では登録できない' do
        @user.first_name_kana = ''
        expect(@user).to_not be_valid
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        expect(@user).to_not be_valid
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        expect(@user).to_not be_valid
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        expect(@user).to_not be_valid
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        expect(@user).to_not be_valid
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        expect(@user).to_not be_valid
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        expect(@user).to_not be_valid
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        expect(@user).to_not be_valid
      end
      it 'passwordとconfirmが一致していないと登録できない' do
        @user.password = 'test123'
        @user.password_confirmation = 'test1234'
        expect(@user).to_not be_valid
      end
      it 'passwordが英数字混合でも6文字未満なら登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        expect(@user).to_not be_valid
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        expect(another_user).to_not be_valid
      end
      it 'emailには@が含まれていないと登録できない' do
        @user.email = 'aaaaaaa'
        expect(@user).to_not be_valid
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        expect(@user).to_not be_valid
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'aaaa'
        expect(@user).to_not be_valid
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaa'
        expect(@user).to_not be_valid
      end
      it 'family_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaaa'
        expect(@user).to_not be_valid
      end
    end
  end
end
