# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## addressesテーブル（住所）
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|prefecture_id|integer|null:false|
|municipality|string|null:false|
|address|string|null:false|
|zip_code|integer(7)|null:false|
|user_id|references|null:false, foreign_key: true|
|tel|integer|null:true|
|building_name|string|null:true|

### Association
- belongs_to :user

## creditsテーブル（クレジットカード）
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|customer_id|string|null:false|
|number|integer|null: false|

### Association
- belongs_to :user

## Usersテーブル（会員）
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|birth_date|datetime|null: false|

### Association
- has_one :credit
- has_one :address
- has_many :items
- has_many :comments

## commentsテーブル（コメント）
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|text|string|null: false|

### Association
- belongs_to :user
- belongs_to :item

## Itemsテーブル（商品）
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: true, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: true, foreign_key: true|
|name|string|null:false|
|introduction|string|null:false|
|price|integer|null:false|
|status|string|null: false|
|value|string|null:false|
|shipping_payer|string|null:false|
|delivery_method|string|null:false|
|shipping_duration|string|null:false|
|shipping_area|string|null:false|
|deal_closed_date|date|null:true|

### Association
- belongs_to :user
- belongs_to :items_condition
- belongs_to :size
- belongs_to :category
- belongs_to :delivery
- belongs_to :brand
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy

## Brandsテーブル（ブランド）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## Categoriesテーブル（カテゴリー）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- belongs_to :size

## Item_imagesテーブル（商品イメージ）
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item

## sizesテーブル（商品のサイズ）
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|size|string|null: false|

### Association
- has_many :categories