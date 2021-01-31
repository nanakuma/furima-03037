class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :shipping_are_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true
  validates :user, presence: true




# イメージのアソシエーションを組む

  has_one_attached :image

  belongs_to :user  
  has_one :purchase
  belongs_to :category


  
end