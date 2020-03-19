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

## Prefectureテーブル（都道府県）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs to :user_address
- belongs to :shipping_address

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

### Association
- belongs to :prefecture
- belongs to :user

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

### Association
- belongs to :prefectures
- belongs to :user

## creditsテーブル（クレジットカード）
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|security_code|integer|null: false|
|expiration_date_year|integer|null: false|
|expiration_date_month|integer|null: false|

### Association
- belongs to :user

## Usersテーブル（会員）
|Column|Type|Options|
|------|----|-------|
|credits_id|reference|null: false|
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|birth_year|datetime|null: false|
|birthday_month|datetime|null: false|
|birthday_day|datetime|null: false|

### Association
- belongs to :credit
- belongs to :user address
- belongs to :shipping address
- has many :items
- has many :comments

## commentsテーブル（コメント）
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|text|string|null: false|

### Association
- belongs to :user
- belongs to :item

## Itemsテーブル（商品）
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|item_image_id|references|null: false, foreign_key: true|
|items_conditions_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|top_category_id|references|null: false, foreign_key: true|
|middle_category_id|references|null: false, foreign_key: true|
|lower_category_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|delivery_burden_id|references|null: false, foreign_key: true|
|item_status_id|references|null: false, foreign_key: true|
|delivery_date_id|references|null: false, foreign_key: true|
|brand|string|null:true|
|name|string|null:false|
|introduction|string|null:false|
|price|string|null:false|
|value|string|null:false|
|deal_closed_date|date|null:true|

### Association
- belongs_to :user
- belongs_to :items_condition
- belongs_to :size
- belongs_to :top_category
- belongs_to: middle_category
- belongs_to :lower_category
- belongs_to :delivery_method
- belongs_to :delivery_burden
- belongs_to :item_status
- belongs_to :delivery_date
- belongs_to :brand
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy

## Top_categorysテーブル（大カテゴリー）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :middle_categories

## Middle_categorysテーブル（中カテゴリー）
|Column|Type|Options|
|------|----|-------|
|top_category_id|references|null:false, forgin_key: true|
|name|string|null: false|

### Association
- has_many :items
- has_many :lower_categories
- belongs_to :top_category

## Lower_categorysテーブル（小カテゴリー）
|Column|Type|Options|
|------|----|-------|
|middle_category_id|references|null:false, forgin_key: true|
|name|string|null: false|

### Association
- has_many :items
- belongs_to :middle_category
- belongs_to :size

## item_imagesテーブル（商品イメージ）
|Column|Type|Options|
|------|----|-------|
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
|lower_category_id|references|null: false, forgin_key: true|
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