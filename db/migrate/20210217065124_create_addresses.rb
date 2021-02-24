class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
t.string  :post_num
t.integer :shipping_area_id
t.string  :municipalities
t.string  :addresses
t.string  :building
t.string  :tel

t.references :order,foreign_key: true
t.timestamps
    end
  end
end
