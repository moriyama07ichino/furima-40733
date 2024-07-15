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

## ユーザー情報テーブル（Users）
|Column  |Type  |Options                  |
|nickname|string|null: false              |
|email   |string|null: false, unique: true|
|password|string|null: false              |

### Association
- has_many :items
- has_many :Orders

## 商品情報テーブル（Items）
|Column         |Type       |Options                       |
|user_id	      |references	|null: false, foreign_key: true|
|image	        |string 	  |null: false                   |
|name	          |string  	  |null: false                   |
|description	  |text	      |null: false                   |
|category	      |integer	  |null: false                   |
|condition	    |integer	  |null: false                   |
|shipping_cost	|integer	  |null: false                   |
|area	          |integer	  |null: false                   |
|days_to_ship 	|integer	  |null: false                   |
|price	        |integer	  |null: false                   |

### Association
- belongs_to :User
- belongs_to :Order

## 購入記録テーブル（Orders）
|Column   |Type       |Options                       |
|user_id	|references	|null: false, foreign_key: true|
|item_id	|references	|null: false, foreign_key: true|

### Association
- belongs_to :User
- belongs_to :Item
- has_one :ShippingAddress

## 発送先情報テーブル（ShippingAddresses）
|Column       |Type       |Options                       |
|order_id	    |references	|null: false, foreign_key: true|
|postal_code	|string	    |null: false                   |
|prefecture 	|integer	  |null: false                   |
|city	        |string	    |null: false                   |
|address      |string	    |null: false                   |
|building     |string	    |                              |
|phone_number	|string	    |null: false                   |

### Association
- belongs_to :Order