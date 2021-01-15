# DB 設計

## 会員情報 users table

## ニックネーム
## メールアドレス
## パスワード
## パスワード確認
## 姓 漢字
## 名 漢字
## 姓 カナ
## 名 カナ
## 生年月日

| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| nickname                       | string              | null: false             | 
| email                          | string              | null: false, unique: true |
| encrypted_password             | string              | null: false             |
| firstname_kanji                | string              | null: false             |
| lastname_kanji                 | string              | null: false             |
| firstname_kana                 | string              | null: false             |
| lastname_kana                  | string              | null: false             |
| birth                          | data                | null: false             |

* has_many :items
* has_many :purchases

## 商品情報 items table
## 出品画像
## 商品名
## 商品説明
## カテゴリー
## 商品の状態
## 発送料の負担
## 発送先の地域
## 発送までの日数
## 販売価格


| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| item_name                      | string              | null: false            |
| item_explanation               | text                | null: false            |
| item_category_id               | integer             | null: false            |
| item_state_id                  | integer             | null: false            |
| delivery_cost_id               | integer             | null: false            |
| shipping_area_id               | integer             | null: false            |
| shipping_days_id               | integer             | null: false            |
| price                          | string              | null: false            |

belongs_to :user

has_one :purchase

## 購入画面 purchase table

| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| user                           | references          | foreign_key: true       | 
| item                           | references          | foreign_key: true       | 

belongs_to :user
belongs_to :item
has_one :customer


## 発送先情報  customer table

| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| post_num                       | string              | null: false            | 
| shipping_area_id               | integer             | null: false            |
| municipalities                 | string              | null: false            |
| address                        | string              | null: false            |
| building                       | string              |                         |
| tel                            | string              | null: false             |
| perchase_id                    | reference           | foreign_key: true       |

belongs_to :purchase





