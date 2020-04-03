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
|tel|string|null:true|
|building_name|string|null:true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## creditsテーブル（クレジットカード）
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|customer_id|string|null:false|
|number|string|null: false|

### Association
- belongs_to :user

## Usersテーブル（会員）
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|nickname|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|null: true|
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
|size_id|references|null: true, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|name|string|null:false|
|introduction|string|null:false|
|brand|string|null:true|
|price|integer|null:false|
|status_id|integer|null: false|
|value|string|null:true|
|trade_id|integer|null: false|
|payer_id|integer|null:false|
|delivery_id|integer|null:false|
|sduration_id|integer|null:false|
|prefecture_id|integer|null:false|
|deal_closed_date|date|null:true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: true, foreign_key: true|

### Association
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :payer
- belongs_to_active_hash :delivery
- belongs_to_active_hash :duration
- belongs_to_active_hash :status
- belongs_to_active_hash :trade
- belongs_to :user, optional: true
- belongs_to :size, optional: true
- belongs_to :category
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy
- accepts_nested_attributes_for :item_images, allow_destroy: true

## Categoriesテーブル（カテゴリー）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: true|

### Association
- has_ancestry
- belongs_to :size, optional: true
- has_many :items

## Item_imagesテーブル（商品イメージ）
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item, optional: true

## sizesテーブル（商品のサイズ）
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :categories
- has_many :items