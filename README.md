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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|mail|string|unique:true, null:false|
|password|string|null:false, null:false|
|re_password|string|null:false, null:false|

### Association
- has_one :user_detail
- has_many :products
- has_many :sns_credentials
- has_one :address

## user_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|string|null:false|
|tel|string|null:false|
|last_name|string|null:false|
|first_name|string|null:false|
|last_kana_name|string|null:false|
|first_kana_name|string|null:false|
|profile|text||

### Association
- belongs_to :user

## addresssテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|zip|string|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|number|string|null:false|
|bill|string||
|randline|string||

### Association
- belongs_to :user

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|uid|string|unique:true,null:false|
|provider|string|unique:true,null:false|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|card_id|string|unique:true,null:false|
|customer_id|string|null:false|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|string|null:false|
|price|integer|null:false|
|content|text|null:false|
|status_id|integer|null:false|
|derivery_id|integer|null:false|
|burden_id|integer|null:false|
|day_id|integer|null:false|
|buyer_id|references|foreign_key:true|
|seller_id|references|foreign_key:true|

### Association
- belongs_to :user
- has_many :categories
- has_many :images

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key:true|
|image|text|null:false|

### Association
- belongs_to :product

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|name|string|null:false|

### Association
- has_many :products
- has_ancestry