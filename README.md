# テーブル設計

## usersテーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| password             | string | null: false, unique: true |

### Association
 - has_many :tweets
 - has_one :profile


## profileテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| age           | integer    |                                |
| location      | string     |                                |
| hobby         | text       |                                |
| canyon_number | integer    | null: false                    |
| birthday      | date       |                                |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## tweetsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| image         |            |                                |
| concept       | text       | null: false                    |
| price         | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| visit_day     | date       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- has_many :comments


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_number | string     |                                |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     |                                |
| building      | string     |                                |
| phone_number  | string     |                                |
| access_plan   | text       | null: false                    |
| tweet         | references | null: false, foreign_key: true |

### Association
- belongs_to :tweet


## commentsテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| tweet        | references | null: false, foreign_key: true |

### Association
- belongs_to :tweet
