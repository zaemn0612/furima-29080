# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
|nickname         | string | null: false |
|encrypted_password| string | null: false |
|family_name      | string | null: false |
|first_name       | string | null: false |
|family_name_kana | string | null: false |
|first_name_kana  | string | null: false |
|birthday         | date    | null: false |


### Association

- has_many:items
- has_many:purchases

## items テーブル

| Column          | Type     | Options                      |
| ----------------| -------- | ---------------------------- |
|user             |references|null: false, foreign_key: true|
|product_name     | string   | null: false                  |
|category_id      | integer   | null: false                 |
|price            | string   | null: false                  |
|product_condition_id| integer   | null: false                  |
|shipping_charges_id | integer   | null: false                  |
|shipping_address_id | integer   | null: false                  |
|estimated_shipping_date_id| integer   | null: false            |
|comment          | string   | null: false                  |

### Association

- belongs_to:user
- has_one:purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to:user
- belongs_to:item
- has_one:address

## addresses テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
|purchase   | references | null: false, foreign_key: true |
|postal_code| string     | null: false                  |
|prefecture_id    | integer     | null: false                  |
|municipality    | string     | null: false                  |
|address     | string     | null: false                  |
|building_name     | string     |                   |
|phone_number    | string     | null: false                  |

### Association

- belongs_to:purchase




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
