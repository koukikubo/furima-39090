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

| Column               | Type       | Options                        |
| -------              | ---------- | ------------------------------ |
| nickname             | string     | null: false,unique: true  |
| email                | string     | null: false,unique: true  |
| encrypted_password   | references | null: false,unique: true  |  
| family_name          | string     | null: false               |           
| first_name           | string     | null: false               |
| family_name_kana     | string     | null: false               |
| first_name_kana      | string     | null: false               |
| birthday             | string     | null: false               |

### Association
has_many :product
has_many :destination
has_one  :user_transacts

## destinationテーブル

| Column  | Type       | Options                                |
| ------- | ---------- | ------------------------------         |
| user_id              | integer    | null: false,foreign_key: true|
| family_name          | string     | null: false               |           
| first_name           | string     | null: false               |
| family_name_kana     | string     | null: false               |           
| first_name_kana      | string     | null: false               |
| post_code            | string     | null: false               |
| prefecture           | string     | null: false               |
| city_name            | string     | null: false               |
| address              | string     | null: false               |
| building_name        | string     | null: false               |
| phone_number         | string     | null: false               |

### Association
belong_to : user
belong_to : product


## productテーブル

| Column  | Type       | Options                                |
| ------- | ---------- | ------------------------------         |
| image                | string     | null: false               |
| name                 | string     | null: false               |           
| description          | string     | null: false               |
| category             | string     | null: false               |           
| status               | string     | null: false               |
| shipping_cost        | string     | null: false               |
| shipping_prefecture  | string     | null: false               |
| shipping_days        | string     | null: false               |
| price                | string     | null: false               |
| user_id              | string     | null: false               |

### Association
belong_to :user
has_one   :user_transacts
has_one   :destination

## user_transactsテーブル

| Column              | Type       | Options                        |
| -------             | ---------- | ------------------------------ |
| user_id             | integer     | null: false, foreign_key: true|
| product_id          | integer     | null: false, foreign_key: true|              

### Association
belong_to :product
belong_to :user