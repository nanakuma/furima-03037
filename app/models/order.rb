class Order < ApplicationRecord
  has_one :address #has_one
  belongs_to :item #sを入れない
  belongs_to :user
end
