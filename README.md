## users

| Column               | Type    | Options                   |
|--------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |


### Association
- has_many :posts
- has_many :comments
- has_many :likes

## posts

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key :true |


### Association
- belongs_to :user
- has_many :comments
- has_many :likes


## comments

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key :true |
| post   | references | null: false, foreign_key :true |

### Association
- belongs_to :user
- belongs_to :post

## likes

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key :true |
| post   | references | null: false, foreign_key :true |


### Association
- belongs_to :user
- belongs_to :post
