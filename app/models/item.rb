class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # イメージのアソシエーションを組む

  has_one_attached :image

  belongs_to :user  
  has_one    :purchase
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_cost
  belongs_to :shipping_are
  belongs_to :shipping_days
  
  with_options presence: true do

  validates :image

  validates :name
  validates :explanation
  validates :category_id
  validates :state_id
  validates :delivery_cost_id
  validates :shipping_are_id
  validates :shipping_days_id
  validates :price,inclusion:{in: 300..9999999}
  end

  with_options numericality: { other_than: 1 } do
    
  validates :category_id
  validates :state_id
  validates :delivery_cost_id
  validates :shipping_are_id
  validates :shipping_days_id
  end

  with_options numericality: { only_integer: true } do
  validates :price
  end


 
end