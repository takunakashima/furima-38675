# テーブル設計

##　usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | integer| null: false               |

### Association
- has_many :items
- has_many :orders

##　itemsテーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | --------------------------------|
| item_name          | string  | null: false                     |
| explain            | text    | null: false                     |
| category           | string  | null: false                     |
| status             | string  | null: false                     |
| delivery_charge    | string  | null: false                     |
| area               | string  | null: false                     |
| days_required      | string  | null: false                     |
| price              | integer | null: false                     |
| user_id            |reference| null: false , foreign_key: true |

### Association
- belongs_to :user
- has_one :orders


##　ordersテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | -------------------------------|
| user_id            |reference| null: false ,foreign_key: true |
| item_id            |reference| null: false ,foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :addresses

##　addressesテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | -------------------------------|
| post_code          | integer | null: false                    |
| prefectures        | string  | null: false                    |
| municipalities     | string  | null: false                    |
| address            | integer | null: false                    |
| building_name      | string  | null: false                    |
| phone_number       | integer | null: false                    |
| order_id           |reference| null: false                    |

### Association
- belongs_to :order
