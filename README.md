# テーブル設計

##　Userテーブル
|Column       |Type       |Options      |
|-------------|-----------|-------------|
|nickname     |string     |null: false  |
|email        |string     |null: false  |
|password     |string     |null: false  |
|name         |string     |null: false  |
|birthday     |date       |null: false  |

### Association
- has_many: item
- has_many: item


## itemテーブル
|Column             |Type       |Options      |
|-------------------|-----------|-------------|
|item_name          |string     |null: false  |
|item_description   |text       |null: false  |
|category           |string     |null: false  |
|status             |string     |null: false  |
|cost_burden        |string     |null: false  |
|area               |string     |null: false  |
|days               |integer    |null: false  |
|price              |integer    |null: false  |

### Association
- belongs_to :user
- belongs_to :delivery


## deliveryテーブル

|Column       |Type         |Options      |
|-------------|-------------|-------------|
|post_number  |integer      |null: false  |
|prefecture   |string       |null: false  |
|city         |string       |null: false  |
|address      |string       |null: false  |
|building     |string       |             |
|phone_number |string       |null: false  |

### Association
- belongs_to :user
- belongs_to :item
