# README

## usersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | string     | null: false                    |
| email    | string     | null: false                    |
| password | string     | null: false                    |

- has_many :matters
- has_many :donations

##  matterテーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| name         | string    | null: false                    |
| explain      | text      | null: false                    |
| price        | integer   | null: false                    |
| user         | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :donations

## donationテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | references| null: false, foreign_key: true |
| matter   | references| null: false, foreign_key: true |
| price    | integer   | null: false                    |

### Association

- belongs_to :user
- belongs_to :matter