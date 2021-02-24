class Credit 
  include ActiveModel::Model
  attr_accessor :post_num,:shipping_area_id,:municipalities,:addresses,:building,:tel,:user_id,:item_id,:token

  with_options presence: true do
    
    validates :post_num,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_area_id
    validates :municipalities
    validates :addresses
    validates :tel,format: { with: /\A\d{11}\z/, message: "is invalid. Include hyphen(-)" }

    validates :user_id
    validates :item_id

    validates :token
  end
  

  def save
    # 住所の情報を保存
    order = Order.create(item_id: item_id,user_id: user_id)
    Address.create(post_num: post_num, shipping_area_id: shipping_area_id, municipalities: municipalities, building: building, addresses: addresses,tel: tel,order_id: order.id)
  end



end