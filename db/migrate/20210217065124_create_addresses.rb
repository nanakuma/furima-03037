class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
t.string  :post_num           ,null: false
t.integer :shipping_area_id   ,null: false
t.string  :municipalities     ,null: false
t.string  :addresses          ,null: false
t.string  :building         
t.string  :tel                ,null: false

t.references :order,foreign_key: true
t.timestamps
    end
  end
end
