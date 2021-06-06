# 思春期ニキビ連合軍
#### ニキビに悩む中高生のリアルな声が集まる掲示板です。ユーザーはログインすると、ニキビに関する悩みや、自分なりのニキビ治療法を投稿できるようになります。投稿に対しては、コメントをつけることができたり、いいねを追加したりすることができます。マイページでは、自分が投稿した投稿や、自分がいいねした投稿を一覧で見ることができます。

## アプリurl

#### https://nikibirengo-gun.herokuapp.com/

## 制作背景

#### 「ニキビに悩む中高生のリアルな声が集まる掲示板を作ろう」そう考えたことが、このアプリケーションを制作しようと考えたきっかけでした。自分自身、中学高校とニキビに悩んでいたのですが、「ニキビに悩んでいる」と気軽に相談できる場があまりありませんでした。親に勇気を出して相談したりしても「ニキビがあるのは思春期の今だけで、そのうち治るからほっときなさい」みたいに他人事。インターネットで「思春期 ニキビ」みたいに調べても、出てくるのはスキンケア用品の広告ばっかで、ニキビがある自分の弱みに漬け込まれてるみたいで、なんだかなぁと感じていました。そこで、今現在自分と同じようにニキビに悩んでいる中高生のリアルな声が集まる掲示板があれば、ニキビに悩む中高生が、少しでも安心できたり、ニキビを治そうとするモチベーションを高めたりすることができるのでないかと考えました。その為、今回「思春期ニキビ連合軍」というwebアプリケーションを制作させていただきました。

## 工夫したポイント

#### 工夫したポイントは、「次の投稿へ進む」「前の投稿にもどる」ボタンの位置です。ユーザーにアプリケーションを快適に使用してもらえるように、「次の投稿へ進む」「前の投稿に戻る」機能を実装しようと考えていて、最初は投稿のタイトルと投稿の内容の間に、この二つのボタンを設置していました。パソコンでアプリケーションを使用する際はこれでも問題なく使用できたのですが、レスポンシブデザインにして、スマートフォンでアプリケーションを使用してみたとき、これらのボタンを押そうとすると、自分の親指で投稿内容が隠れてしまい、次の投稿や前の投稿を見るのに、いちいち親指を画面から外してから投稿内容を見なければならないことに気がつきました。そこで、これらのボタンをタイトルと投稿内容の下に設置することによって、これらの問題が解決されました。

## 使用技術

#### HTML・CSS・Ruby・Ruby on Rails・jQuary・RSpec

## 課題や今後実装したい機能

#### このアプリケーションの現在の課題は、自分の投稿にコメントやいいねがついても、それ気付くためには、わざわざ自分の投稿の詳細ページを見に行く必要があるということです。その為、今後実装したい機能として、「コメントやいいねがついた時の通知機能」を実装したいと考えています。


# DB設計

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
