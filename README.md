# テーブル設計

##　userテーブル
|Column                 |Type       |Options      |
|-----------------------|-----------|-------------|
|nickname               |string     |null: false  |
|email                  |string     |null: false  |
|encrypted_password     |string     |null: false  |
|last_name              |string     |null: false  |
|first_name             |string     |null: false  |
|last_kana              |string     |null: false  |
|first_kana             |string     |null: false  |
|birthday               |date       |null: false  |

### Association
- has_many :items
- has_many :solds


## itemsテーブル
|Column             |Type           |Options                       |
|-------------------|---------------|------------------------------|
|name               |string         |null: false                   |
|description        |text           |null: false                   |
|category_id        |integer        |null: false                   |
|status_id          |integer        |null: false                   |
|cost_burden_id     |integer        |null: false                   |
|area_id            |integer        |null: false                   |
|days_id            |integer        |null: false                   |
|price              |integer        |null: false                   |
|user               |references     |null: false  foreign_key: true|

### Association
- belongs_to :user
- has_one :sold


## deliveriesテーブル
|Column           |Type         |Options                       |
|-----------------|-------------|------------------------------|
|post_number      |string       |null: false                   |
|prefecture_id    |integer      |null: false                   |
|city             |string       |null: false                   |
|address          |string       |null: false                   |
|building         |string       |                              |
|phone_number     |string       |null: false                   |
|sold             |references   |null: false  foreign_key: true|

### Association
- belongs_to :sold


## soldsテーブル
|Column           |Type         |Options                       |
|-----------------|-------------|------------------------------|
|user             |references   |null: false  foreign_key: true|
|item             |references   |null: false  foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery
