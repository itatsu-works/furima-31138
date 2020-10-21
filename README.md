# テーブル設計

##　Userテーブル
|Column       |Type       |Options      |
|-------------|-----------|-------------|
|nickname     |string     |null: false  |
|email        |string     |null: false  |
|password     |string     |null: false  |
|name         |string     |null: false  |
|kana         |string     |null: false  |
|birthday     |date       |null: false  |

### Association
- has_many :item
- has_many :sold


## itemテーブル
|Column             |Type           |Options      |
|-------------------|---------------|-------------|
|item_name          |string         |null: false  |
|item_description   |text           |null: false  |
|category_id        |integer        |null: false  |
|status_id          |integer        |null: false  |
|cost_burden_id     |integer        |null: false  |
|area_id            |integer        |null: false  |
|days_id            |integer        |null: false  |
|price              |integer        |null: false  |
|user               |references     |null: false  |

### Association
- belongs_to :user
- has_one :sold


## deliveryテーブル

|Column           |Type         |Options      |
|-----------------|-------------|-------------|
|post_number      |string       |null: false  |
|prefecture_id    |integer      |null: false  |
|city             |string       |null: false  |
|address          |string       |null: false  |
|building         |string       |             |
|phone_number     |string       |null: false  |
|sold_id          |integer      |null: false  |

### Association
- belongs_to :sold


## soldテーブル
|Column           |Type         |Options      |
|-----------------|-------------|-------------|
|user             |references   |null: false  |
|item             |references   |null: false  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery
