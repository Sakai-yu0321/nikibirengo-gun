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
[![Image from Gyazo](https://i.gyazo.com/5494ab03759c1772186025a65ec3548b.gif)](https://gyazo.com/5494ab03759c1772186025a65ec3548b)

#### 新規投稿
[![Image from Gyazo](https://i.gyazo.com/39c00ebfa841492498df0abe885e461f.gif)](https://gyazo.com/39c00ebfa841492498df0abe885e461f)

#### 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/e38edf011d826aeac6bc5ba4edebb9b3.gif)](https://gyazo.com/e38edf011d826aeac6bc5ba4edebb9b3)

#### 次の投稿へ進む、前の投稿に戻る
[![Image from Gyazo](https://i.gyazo.com/86d3390d55c826647a63dfac76ce4115.gif)](https://gyazo.com/86d3390d55c826647a63dfac76ce4115)

#### 投稿編集
[![Image from Gyazo](https://i.gyazo.com/7d9112b05bfc55b169fd7e45111975f4.gif)](https://gyazo.com/7d9112b05bfc55b169fd7e45111975f4)

#### 投稿削除
[![Image from Gyazo](https://i.gyazo.com/80a861ea384e154114b411961ee14a1c.gif)](https://gyazo.com/80a861ea384e154114b411961ee14a1c)

#### コメント投稿
[![Image from Gyazo](https://i.gyazo.com/0fcc5c67fa3074141584240bdb46947f.gif)](https://gyazo.com/0fcc5c67fa3074141584240bdb46947f)

#### コメント削除
[![Image from Gyazo](https://i.gyazo.com/2eb8151552cad2372d9e3f0869d50099.gif)](https://gyazo.com/2eb8151552cad2372d9e3f0869d50099)

#### いいね、いいね取り消し
[![Image from Gyazo](https://i.gyazo.com/303547c78a4f1f0db36780a61b7af227.gif)](https://gyazo.com/303547c78a4f1f0db36780a61b7af227)

#### マイページ機能
[![Image from Gyazo](https://i.gyazo.com/d3f523027e34cb0026ce9b34db875992.gif)](https://gyazo.com/d3f523027e34cb0026ce9b34db875992)
##### 自分の投稿や自分がいいねした投稿を、一覧で見ることができます。

#### ログアウト
[![Image from Gyazo](https://i.gyazo.com/2cc880bfe857abc403764cf6d77ed01a.gif)](https://gyazo.com/2cc880bfe857abc403764cf6d77ed01a)

#### 投稿ワード検索
[![Image from Gyazo](https://i.gyazo.com/4221ac70cb564af9cd0e2a5d2aedd713.gif)](https://gyazo.com/4221ac70cb564af9cd0e2a5d2aedd713)

#### 投稿カテゴリ検索
[![Image from Gyazo](https://i.gyazo.com/94f788d55c94e9790441899fb2a1d179.gif)](https://gyazo.com/94f788d55c94e9790441899fb2a1d179)

## 工夫したポイント

#### 工夫したポイントは、「次の投稿へ進む」「前の投稿にもどる」ボタンの位置です。ユーザーにアプリケーションを快適に使用してもらえるように、「次の投稿へ進む」「前の投稿に戻る」機能を実装しようと考えていて、最初は投稿のタイトルと投稿の内容の間に、この二つのボタンを設置していました。パソコンでアプリケーションを使用する際はこれでも問題なく使用できたのですが、レスポンシブデザインにして、スマートフォンでアプリケーションを使用してみたとき、これらのボタンを押そうとすると、自分の親指で投稿内容が隠れてしまい、次の投稿や前の投稿を見るのに、いちいち親指を画面から外してから投稿内容を見なければならないことに気がつきました。そこで、これらのボタンをタイトルと投稿内容の下に設置することによって、これらの問題が解決されました。

## 使用技術

### バックエンド
##### Ruby, Ruby on Rails

### フロントエンド
##### HTML, CSS, javaScript(JQuery) 

### データベース
##### MySQL, Sequel Pro

### ソース管理
##### GitHub

### テスト
##### RSpec

### エディタ
##### VSCode

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
