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

## user_detailテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|text|null:false|
|tell|integer|unique:true, null:false|
|zip|integer|null:false|
|address|text|null:false|

<!-- ## snsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|google|text|unique:true|
|facebook|text|unique:true| -->

## productテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|name|text|null:false|
|image|data|null:false|
|price|integer|null:false|
|content|text|null:false|

## product_detailテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|product_id|references|null:false|
|status|text|null:false|
|derivery|text|null:false|
|burden|text|null:false|
|day|data|null:false|
|area|text|null:false|

