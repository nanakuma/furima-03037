class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image,presence: true

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 } , presence: true
  validates :state_id, numericality: { other_than: 1 } , presence: true
  validates :delivery_cost_id, numericality: { other_than: 1 } , presence: true
  validates :shipping_are_id, numericality: { other_than: 0 } , presence: true
  validates :shipping_days_id, numericality: { other_than: 1 } , presence: true
  validates :price, presence: true,inclusion:{in: 300..9999999}, presence: true
  validates :user, presence: true




# イメージのアソシエーションを組む

  has_one_attached :image

  belongs_to :user  
  has_one :purchase
  belongs_to :category


  
end