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
- has_many :snss
- has_many :comments
- has_many :likes
- has_many :product_buys
- has_one :address

## user_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|string|null:false|
|tell|integer|unique:true, null:false|

### Association
- has_one :user

## addresssテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|zip|string|null:false|
|address|string|null:false|
|city|string|null:false|
|number|string|null:false|
|bill|string||

### Association
- belongs_to :user

## snssテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|string|null:false|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|number|string|unique:true,null:false|
|cord|string|unique:true,null:false|
|limit|string|null:false|
|name|string|null:false|

### Association
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|
|comment|text|null:false|

### Association
- belongs_to :user
- belongs_to :product

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|

### Association
- belongs_to :user
- belongs_to :product

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|string|null:false|
|price|integer|null:false|
|content|text|null:false|
|status|integer|null:false|
|derivery|integer|null:false|
|burden|integer|null:false|
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

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|image|text|null:false|

### Association
- belongs_to :product

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|name|string|null:false|

### Association
- belongs_to :product

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|brnads_id|references|null:false|
|name|string|null:false|

### Association
- belongs_to :product
- has_many :brands, through: brand_categorys

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null:false|
|categorys_id|references|null:false|
|name|string|null:false|

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

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|

### Association
- belongs_to :user
- belongs_to :product