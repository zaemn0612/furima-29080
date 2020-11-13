# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
|nickname         | string | null: false |
|password         | string | null: false |
|confirm password | string | null: false |
|family name      | string | null: false |
|first name       | string | null: false |
|family name(カナ) | string | null: false |
|first name(カナ)  | string | null: false |
|birthday(year)   | string | null: false |
|birthday(month)  | string | null: false |
|birthday(day)    | string | null: false |

### Association

- has_many:items
- has_many:purchases

## items テーブル

| Column          | Type     | Options                      |
| ----------------| -------- | ---------------------------- |
|user             |references|null: false, foreign_key: true|
|商品名            | string   | null: false                  |
|カテゴリ           | string   | null: false                 |
|値段              | string   | null: false                  |
|出品者            | string   | null: false                  |
|商品の状態         | string   | null: false                  |
|配送料の負担       | string   | null: false                  |
|発送元の住所       | string   | null: false                  |
|発送日の目安       | string   | null: false                  |
|画像データ         | string   | null: false                  |
|商品コメント       | string   | null: false                  |

### Association

- belongs_to:user
- has_one:purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
|購入者   | string     | null: false                    |
|購入時期 | string     | null: false                    |
|購入商品 | string     | null: false                    |

### Association

- belongs_to:user
- belongs_to:item
- has_many:addresses

## addresses テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| purchases | references | null: false, foreign_key: true |
|郵便番号    | string     | null: false                  |
|都道府県    | string     | null: false                  |
|市区町村    | string     | null: false                  |
|番地       | string     | null: false                  |
|建物名     | string     | null: false                  |
|電話番号    | string     | null: false                  |

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
