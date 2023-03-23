class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #:validatableは既存でパスワードの
  # カラムのバリデーション
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  # パスワードのバリデーション（空では登録できない且つ６文字以上でないといけない。）
  validates :password, length: { minimum: 6 }
  #パスワードは英数字混合でないといけない。
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  #カタカナのみでのバリデーション
  validates :family_name_kana,:first_name_kana,format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"カタカナでご入力下さい。"}
  #漢字のみでのバリデーション
  validates :family_name,:first_name,format:{with:/\A[一-龥]+\z/,message:"漢字でご入力下さい。"}
  
end
