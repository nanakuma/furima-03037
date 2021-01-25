class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :birth
          
         end

         with_options presence: true, format: { with: /\A[一-龥]+\z/, message: '全角漢字を使用してください' } do
          validates :firstname_kanji
          validates :lastname_kanji
        end

        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
          validates :firstname_kana
          validates :lastname_kana
        end

  validates_format_of :password, with: VALID_PASSWORD_REGEX
  

  has_many :items
  has_many :purchases
         
end
