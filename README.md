# DB 設計

## 会員情報　users table

## ニックネーム
## メールアドレス
##　パスワード
##　パスワード確認
##　姓　漢字
##　名　漢字
##　姓　カナ
##　名　カナ
##　生年月日

| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| nickname                       | string              | null: false             | 
| mail                           | string              | null: false             |
| password                       | string              | null: false             |
| password_verrification         | string              | null: false             |
| firstname_kanji                | string              | null: false             |
| lastname_kanji                 | string              | null: false             |
| firstname_kana                 | string              | null: false             |
| lastname_kana                  | string              | null: false             |
| birth                          | integer             | null: false             |

* has_many :items
* has_many :purchase
* has_one  :customer


## 商品情報　items table
## 出品画像
##　商品名
##　商品説明
##　カテゴリー
##　商品の状態
##　発送料の負担
##　発送先の地域
##　発送までの日数
##　販売価格


| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| item_image                     | references          | null: false             | 
| item_name                      | text                | null: false             |
| item_explanation               | text                | null: false             |
| item_category                  | integer             | null: false             |
| item_state                     | integer             | null: false             |
| delivery_cost                  | integer             | null: false             |
| shipping_area                  | integer             | null: false             |
| shipping_days                  | integer             | null: false             |
| price                          | string              | null: false             |

belongs_to :user

## 購入画面 purchase table

##　カード情報
##　有効期限
##　セキュリティコード

| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| card_infomation                | string              | null: false             | 
| expiration                     | integer             | null: false             |
| security                       | string              | null: false             |

belongs_to :user


## 発送先情報  customer table

| Column                         | Type                | Options                 |
|------------------------------- |---------------------|-------------------------|
| post_num                       | string              | null: false             | 
| perfectures                    | integer             | null: false             |
| municipalities                 | text                | null: false             |
| address                        | text                | null: false             |
| bilding                        | text                |                         |
| tel                            | string              | null: false             |

belongs_to :user





