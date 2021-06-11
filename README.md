# 思春期ニキビ連合軍
#### ニキビに悩む中高生のリアルな声が集まる掲示板です。ユーザーはログインすると、ニキビに関する悩みや、自分なりのニキビ治療法を投稿できるようになります。投稿に対しては、コメントをつけることができたり、いいねを追加したりすることができます。マイページでは、自分が投稿した投稿や、自分がいいねした投稿を一覧で見ることができます。

## 本番環境

#### https://nikibirengo-gun.herokuapp.com/
#### ログイン情報（テスト用）
- email: test@test
- password: 111111

## 制作背景(意図)

#### 「ニキビに悩む中高生のリアルな声が集まる掲示板を作ろう」そう考えたことが、このアプリケーションを制作しようと考えたきっかけでした。自分自身、中学高校とニキビに悩んでいたのですが、「ニキビに悩んでいる」と気軽に相談できる場があまりありませんでした。親に勇気を出して相談したりしても「ニキビがあるのは思春期の今だけで、そのうち治るからほっときなさい」みたいに他人事。インターネットで「思春期 ニキビ」みたいに調べても、出てくるのはスキンケア用品の広告ばっかで、ニキビがある自分の弱みに漬け込まれてるみたいで、なんだかなぁと感じていました。そこで、今現在自分と同じようにニキビに悩んでいる中高生のリアルな声が集まる掲示板があれば、ニキビに悩む中高生が、少しでも安心できたり、ニキビを治そうとするモチベーションを高めたりすることができるのでないかと考えました。その為、今回「思春期ニキビ連合軍」というwebアプリケーションを制作させていただきました。

## DEMO

##### ユーザー新規登録
[![Image from Gyazo](https://i.gyazo.com/80c0f17cbaab86a5fd952f10c97c7591.gif)](https://gyazo.com/80c0f17cbaab86a5fd952f10c97c7591)

#### 新規投稿
[![Image from Gyazo](https://i.gyazo.com/1d749c54ec886e17a5cafef3c31f0fd1.gif)](https://gyazo.com/1d749c54ec886e17a5cafef3c31f0fd1)

#### 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/497c12a1421906b96523185af550a625.gif)](https://gyazo.com/497c12a1421906b96523185af550a625)

#### 次の投稿へ進む、前の投稿に戻る
[![Image from Gyazo](https://i.gyazo.com/1fa3eb9a649690d66226ca675ab9781b.gif)](https://gyazo.com/1fa3eb9a649690d66226ca675ab9781b)

#### 投稿編集
[![Image from Gyazo](https://i.gyazo.com/3a767cef4b0248c9d9fa0c1801d593b3.gif)](https://gyazo.com/3a767cef4b0248c9d9fa0c1801d593b3)

#### 投稿削除
[![Image from Gyazo](https://i.gyazo.com/346943967685b7b70ffa22e9b82f72f1.gif)](https://gyazo.com/346943967685b7b70ffa22e9b82f72f1)

#### コメント投稿
[![Image from Gyazo](https://i.gyazo.com/47fd7a7dd4032db1eaad5998d04c19bb.gif)](https://gyazo.com/47fd7a7dd4032db1eaad5998d04c19bb)

#### コメント削除
[![Image from Gyazo](https://i.gyazo.com/4770fd04f6511c34219f7bbaf6159381.gif)](https://gyazo.com/4770fd04f6511c34219f7bbaf6159381)

#### いいね、いいね取り消し
[![Image from Gyazo](https://i.gyazo.com/109adb1fc45b31790e861373d38ce4e0.gif)](https://gyazo.com/109adb1fc45b31790e861373d38ce4e0)

#### マイページ機能
[![Image from Gyazo](https://i.gyazo.com/ea87dbe0e54f07b9e2a729f52535167d.gif)](https://gyazo.com/ea87dbe0e54f07b9e2a729f52535167d)
##### 自分の投稿や自分がいいねした投稿を、一覧で見ることができます。

#### 投稿ワード検索
[![Image from Gyazo](https://i.gyazo.com/9466b411f141339c3109d1ac2c2dd1ac.gif)](https://gyazo.com/9466b411f141339c3109d1ac2c2dd1ac)

#### 投稿カテゴリ検索
[![Image from Gyazo](https://i.gyazo.com/6a7882abacf5860f9ee253efac27ee83.gif)](https://gyazo.com/6a7882abacf5860f9ee253efac27ee83)

#### お問い合わせフォーム
[![Image from Gyazo](https://i.gyazo.com/a7eef126633384cd99bdd4325c589d0a.gif)](https://gyazo.com/a7eef126633384cd99bdd4325c589d0a)

#### ログアウト
[![Image from Gyazo](https://i.gyazo.com/393ecc8be405eaa54217c61619717c4f.gif)](https://gyazo.com/393ecc8be405eaa54217c61619717c4f)


## 工夫したポイント

#### 工夫したポイントは、「次の投稿へ進む」「前の投稿にもどる」ボタンの位置です。ユーザーにアプリケーションを快適に使用してもらえるように、「次の投稿へ進む」「前の投稿に戻る」機能を実装しようと考えていて、最初は投稿のタイトルと投稿の内容の間に、この二つのボタンを設置していました。パソコンでアプリケーションを使用する際はこれでも問題なく使用できたのですが、レスポンシブデザインにして、スマートフォンでアプリケーションを使用してみたとき、これらのボタンを押そうとすると、自分の親指で投稿内容が隠れてしまい、次の投稿や前の投稿を見るのに、いちいち親指を画面から外してから投稿内容を見なければならないことに気がつきました。そこで、これらのボタンをタイトルと投稿内容の下に設置することによって、これらの問題が解決されました。

## 使用技術

### バックエンド
##### Ruby, Ruby on Rails

### フロントエンド
##### HTML, CSS, JQuery

### データベース
##### MySQL, Sequel Pro, S3

### デプロイ
##### heroku

### ソース管理
##### GitHub

### テスト
##### RSpec

### エディタ
##### VSCode

#### HTML・CSS・Ruby・Ruby on Rails・jQuery・RSpec

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
