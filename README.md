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
| nickname             | string     | null: false               |
| email                | string     | null: false               |
| encrypted_password   | string     | null: false               |  
| family_name          | string     | null: false               |           
| first_name           | string     | null: false               |
| family_name_kana     | string     | null: false               |
| first_name_kana      | string     | null: false               |
| birthday             | date       | null: false               |

### Association
has_many :product
has_many :user_transacts

## destinationテーブル

| Column  | Type       | Options                                |
| ------- | ---------- | ------------------------------         |
| post_code            | string     | null: false               |
| prefecture_id        | string     | null: false, foreign_key: true|              
| city_name            | string     | null: false               |
| address              | string     | null: false               |
| building_name        | string     |                           |
| phone_number         | string     | null: false               |
| user_transacts_id    | integer     | null: false, foreign_key: true|
### Association
belong_to : product
has_one : user_transacts


## productテーブル

| Column  | Type          | Options                                 |
| ------- | ----------    | ------------------------------          |
| name                    | string      | null: false                |           
| description             | text        | null: false                |
| category_id             | integer     | null: false, foreign_key: true |           
| status_id               | integer     | null: false, foreign_key: true |
| shipping_cost_id        | integer     | null: false, foreign_key: true |
| prefecture_id           | integer     | null: false, foreign_key: true |
| shipping_days_id        | integer     | null: false, foreign_key: true |
| price                   | integer     | null: false               |
| user_id                 | date        | null: false, foreign_key: true|

### Association
belong_to :user
has_one :destination
has_many :user_transacts

## user_transactsテーブル

| Column              | Type       | Options                        |
| -------             | ---------- | ------------------------------ |
| user_id             | integer     | null: false, foreign_key: true|
| product_id          | integer     | null: false, foreign_key: true|              

### Association
belong_to :product
belong_to :user
belong_to :destination