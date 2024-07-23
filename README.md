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
|Column         |Type   |Options                        |
|nickname       |string |null: false                    |
|email          |string |null: false, unique: true      |
|password       |string |null: false                    |
|first_name     |string |null: false                    |
|last_name      |string |null: false                    |
|first_name_kana|string |null: false                    |
|last_name_kana |string |null: false                    |
|birthday       |date   |null: false                    |

### Association
- has_many :items
- has_many :orders

## 商品情報テーブル（Items）
|Column              |Type        |Options                       |
|user                |references	|null: false, foreign_key: true|
|name	               |string  	  |null: false                   |
|description	       |text	      |null: false                   |
|category_id         |integer	    |null: false                   |
|condition	         |integer	    |null: false                   |
|shipping_cost_id	   |integer	    |null: false                   |
|prefecture_id       |integer	    |null: false                   |
|days_to_ship_id 	   |integer	    |null: false                   |
|price	             |integer	    |null: false                   |

### Association
- belongs_to :user
- has_one :order

## 購入記録テーブル（Orders）
|Column   |Type       |Options                       |
|user   	|references	|null: false, foreign_key: true|
|item   	|references	|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## 発送先情報テーブル（ShippingAddresses）
|Column          |Type        |Options                       |
|order  	       |references	|null: false, foreign_key: true|
|postal_code	   |string	    |null: false                   |
|prefecture_id 	 |integer	    |null: false                   |
|city	           |string	    |null: false                   |
|address         |string	    |null: false                   |
|building        |string	    |                              |
|phone_number	   |string	    |null: false                   |

### Association
- belongs_to :order