class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do

  validates :image

  validates :name
  validates :explanation
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :delivery_cost_id, numericality: { other_than: 1 }
  validates :shipping_are_id, numericality: { other_than: 0 }
  validates :shipping_days_id, numericality: { other_than: 1 }
  validates :price, presence: true,inclusion:{in: 300..9999999}
  validates :user

  end




# イメージのアソシエーションを組む

  has_one_attached :image

  belongs_to :user  
  has_one :purchase
  belongs_to :category


  
end