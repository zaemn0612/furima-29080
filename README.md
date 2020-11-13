# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
|nickname         | string | null: false |
|password         | string | null: false |
|confirm password | string | null: false |
|family_name      | string | null: false |
|first_name       | string | null: false |
|family_name(カナ) | string | null: false |
|first_name(カナ)  | string | null: false |
|birthday         | date    | null: false |


### Association

- has_many:items
- has_many:purchases

## items テーブル

| Column          | Type     | Options                      |
| ----------------| -------- | ---------------------------- |
|user             |references|null: false, foreign_key: true|
|product_name     | string   | null: false                  |
|category         | string   | null: false                 |
|price            | string   | null: false                  |
|seller           | string   | null: false                  |
|product condition| string   | null: false                  |
|shipping charges | string   | null: false                  |
|shipping address | string   | null: false                  |
|estimated shipping date| string   | null: false            |
|image            | string   | null: false                  |
|comment          | string   | null: false                  |

### Association

- belongs_to:user
- has_one:purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
|purchaser   | string     | null: false                    |
|when to buy | string     | null: false                    |
|purchase goods| string     | null: false                    |

### Association

- belongs_to:user
- belongs_to:item
- has_many:addresses

## addresses テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| purchases | references | null: false, foreign_key: true |
|postal code    | string     | null: false                  |
|prefectures    | string     | null: false                  |
|municipality    | string     | null: false                  |
|address     | string     | null: false                  |
|building_name     | string     | null: false                  |
|phone number    | string     | null: false                  |

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
