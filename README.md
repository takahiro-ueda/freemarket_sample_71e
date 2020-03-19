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

### Association
- belongs_to :user_address
- belongs_to :shipping_address

## User_addressテーブル（住所）
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|tel|string|null:false|
|prefectures_id|string|null:false|
|municipality|string|null:false|
|address|string|null:false|
|building_name|string|null:false|
|zip_code|integer(7)|null:false|
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :prefecture
- belongs_to :user

## Shipping_addressテーブル（送付先住所）
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|fast_name_kana|string|null: false|
|tel|integer|null: false|
|prefectures_id|references|null: false, foreign_key:true|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|zip_code|string|null: false|
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :prefectures
- belongs_to :user

## creditsテーブル（クレジットカード）
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|security_code|integer|null: false|
|expiration_date_year|integer|null: false|
|expiration_date_month|integer|null: false|
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user

## Usersテーブル（会員）
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|birth_year|datetime|null: false|
|birthday_month|datetime|null: false|
|birthday_day|datetime|null: false|

### Association
- has_one :credit
- has_one :user_address
- has_one :shipping_address
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
|buyer_id|references|null: false, foreign_key: true|
|items_conditions_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|delivery_burden_id|references|null: false, foreign_key: true|
|item_status_id|references|null: false, foreign_key: true|
|delivery_date_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|name|string|null:false|
|introduction|string|null:false|
|price|string|null:false|
|value|string|null:false|
|deal_closed_date|date|null:true|

### Association
- belongs_to :user
- belongs_to :items_condition
- belongs_to :size
- belongs_to :category
- belongs_to :delivery_method
- belongs_to :delivery_burden
- belongs_to :item_status
- belongs_to :delivery_date
- belongs_to :brand
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy

## Brandsテーブル（ブランド）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## Categorysテーブル（カテゴリー）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items

## item_imagesテーブル（商品イメージ）
|Column|Type|Options|
|------|----|-------|
|items_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item

## Items_conditionsテーブル（商品の状態）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## sizesテーブル（商品のサイズ）
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, forgin_key: true|
|size|integer|null: false|

### Association
- has_many :lower_categories

## delivery_methodテーブル（配達方法）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## delivery_burdenテーブル（配送手数料）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## item-statusテーブル（取引のステータス）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## delivery_dateテーブル（配送日付）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items