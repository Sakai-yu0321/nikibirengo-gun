# 思春期ニキビ連合軍
#### ニキビに悩む中高生のリアルな声が集まる掲示板です。ユーザーはログインすると、ニキビに関する悩みや、自分なりのニキビ治療法を投稿できるようになります。投稿に対しては、コメントをつけることができたり、いいねを追加したりすることができます。マイページでは、自分が投稿した投稿や、自分がいいねした投稿を一覧で見ることができます。

## アプリurl

#### https://nikibirengo-gun.herokuapp.com/

## 制作背景

#### 自分自身、中学高校とニキビに悩んでいたのですが、「ニキビに悩んでいる」と気軽に相談できる場がなかったことが、この掲示板を作ろうと思ったきっかけでした。親に勇気を出して相談したりしても「ニキビがあるのは思春期の今だけで、そのうち治るからほっときなさい」みたいに他人事。インターネットで「思春期 ニキビ」みたいに調べても、出てくるのはスキンケア用品の広告ばっかで、ニキビがある自分の弱みに漬け込まれてるみたいで、なんだかなぁと感じていました。そこで、今現在自分と同じようにニキビに悩んでいる中高生の、リアルな声が集まる掲示板があれば、ニキビに悩む中高生が、少しでも安心できたり、ニキビを治そうとするモチベーションを高めたりすることができるのでないかと考えました。

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

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key :true |


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
