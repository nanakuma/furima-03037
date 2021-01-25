class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :firstname_kanji, presence: true
  validates :lastname_kanji, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birth, presence: true

  validates_format_of :password, with: VALID_PASSWORD_REGEX
  

  has_many :items
  has_many :purchases
         
end
