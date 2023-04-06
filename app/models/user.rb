class User < ApplicationRecord
  has_many :products
  has_many :user_transacts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable # :validatableは既存でパスワード,Emailはエラーメッセージを出してくれる。
  # カラムのバリデーション
  with_options presence: true do
      validates :nickname
      validates :family_name
      validates :family_name_kana
      validates :first_name
      validates :first_name_kana
      validates :birthday
  end

  # パスワードは英数字混合でないといけない。
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
validates :password, format: { with: VALID_PASSWORD_REGEX }
  # カタカナのみでのバリデーション
  validates :family_name_kana, :first_name_kana, format: { with: /\A[\p{katakana}ー]+\z/ }
  # 漢字のみでのバリデーション
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
end
