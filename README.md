# テーブル設計

##　usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false , unique: true| 
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | data   | null: false               |

### Association
- has_many :items
- has_many :orders

##　itemsテーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | --------------------------------|
| item_name          | string  | null: false                     |
| explain            | text    | null: false                     |
| category_id        | string  | null: false                     |
| status_id          | string  | null: false                     |
| delivery_charge_id | string  | null: false                     |
| area_id            | string  | null: false                     |
| days_required_id   | string  | null: false                     |
| price              | integer | null: false                     |
| user               |reference| null: false , foreign_key: true |

### Association
- belongs_to :user
- has_one :order


##　ordersテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | -------------------------------|
| user               |reference| null: false ,foreign_key: true |
| item               |reference| null: false ,foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

##　addressesテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | -------------------------------|
| post_code          | string  | null: false                    |
| area_id            | string  | null: false                    |
| municipalities     | string  | null: false                    |
| address            | integer | null: false                    |
| building_name      | string  |                                |
| phone_number       | string  | null: false                    |
| order              |reference| null: false                    |

### Association
- belongs_to :order
