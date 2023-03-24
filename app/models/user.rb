class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # :validatableは既存でパスワード,Emailはエラーメッセージを出してくれる。
  # カラムのバリデーション
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  
  
  # パスワードは英数字混合でないといけない。
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  # カタカナのみでのバリデーション
  validates :family_name_kana, :first_name_kana, format: { with:/\A[\p{katakana}ー]+\z/, message: 'カタカナでご入力下さい。' }
  # 漢字のみでのバリデーション
  validates :family_name, :first_name, format: { with: \A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: '漢字でご入力下さい。' }
end
