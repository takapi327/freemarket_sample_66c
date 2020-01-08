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


## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|mail|string|unique:true, null:false|
|password|string|null:false, null:false|
|re_password|string|null:false, null:false|

### Association
- belongs_to :user_detail
- has_many :products
- has_many :snss
- has_many :comments
- has_many :likes
- has_many :product_buys
- belongs_to :address

## user_detailテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|text|null:false|
|tell|integer|unique:true, null:false|
|zip|integer|null:false|
|address|text|null:false|

### Association
- belongs_to :user

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|zip|string|null:false|
|address|text|null:false|
|city|text|null:false|
|number|string|null:false|
|bill|text||

### Association
- belongs_to :user

## snsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|text|null:false|

### Association
- belongs_to :user

## cardテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|number|string|unique:true,null:false|
|cord|string|unique:true,null:false|
|limit|string|null:false|
|name|text|null:false|

### Association
- belongs_to :user

## commentテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|
|comment|text|null:false|

### Association
- belongs_to :user
- belongs_to :product

## itemテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|

### Association
- belongs_to :user
- belongs_to :product

## productテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|text|null:false|
|price|integer|null:false|
|content|text|null:false|
|status|text|null:false|
|derivery|text|null:false|
|burden|text|null:false|
|day|data|null:false|

### Association
- belongs_to :user
- belongs_to :item
- has_many :categorys
- has_many :brands
- has_many :areas
- has_many :likes
- has_many :comments
- has_many :images

## imageテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|image|text|null:false|

### Association
- belongs_to :product

## areaテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|name|text|null:false|

### Association
- belongs_to :product

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|brnads_id|references|null:false|
|name|text|null:false|

### Association
- belongs_to :product
- has_many :brands, through: brand_categorys

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|categorys_id|references|null:false|
|name|text|null:false|

### Association
- belongs_to :product
- has_many :categorys,through: brand_categorys

## brand_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|references|null:false|
|categorys_id|references|null:false|

### Association
- belongs_to :brand
- belongs_to :category

## likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|

### Association
- belongs_to :user
- belongs_to :product