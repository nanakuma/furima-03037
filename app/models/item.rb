class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

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

  with_options format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角英数を使用してください' } do
  validates :price
  end




# イメージのアソシエーションを組む

  has_one_attached :image

  belongs_to :user  
  has_one :purchase
  belongs_to :category


  
end