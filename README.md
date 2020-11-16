## :mount_fuji: アプリ名 ： 僕と渓谷


## :bulb: 概要
### 渓谷情報に関するアプリケーション
- 渓谷の情報（渓谷名、画像など）を見る事ができます。
- 渓谷へのアクセス方法がわかります。


## :computer: 本番環境
<dl>
  <dt>接続先</dt>
  <dd> :globe_with_meridians: URL : ** https://canyon-30433.herokuapp.com/ ** </dd>
  <!-- <dt>ID/Pass</dt> -->
  <!-- <dd>ID:</dd> -->
  <!-- <dd>Pass:</dd> -->
  <dt>投稿者</dt>
  <dd>メールアドレス : test@test.com</dd>
  <dd>パスワード : 1asdfg</dd>
  <dt>閲覧者</dt>
  <dd>メールアドレス : sample@sample.com</dd>
  <dd>パスワード : 2asdfg</dd>
</dl>


## :beginner: 利用方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- 投稿方法：テストアカウントでログイン→トップページから投稿ページボタン押下→投稿情報入力→次へ→アクセス情報入力→投稿
- 確認後、ログアウト処理をお願いします。


## :feet: 制作背景
私の趣味は渓谷巡りです。渓谷へ行く計画を立てるときに、情報取集するには一苦労です。<br>有名な山へ登山するときアクセス方法や情報が掲載されているサイトが目に入る機会は多い一方で、渓谷の情報やアクセス方法についてのサイトが目に入る機会は少ないのが現状です。<br>そこで、「『手軽に、渓谷の情報やアクセス方法がわかる』サイトがあったら嬉しい」と思い、制作し始めました。渓谷の魅力を発信していきたい思いも制作に含めています。


## :pencil2: 洗い出した要件
[要件定義をまとめたスプレッドシートへ](https://docs.google.com/spreadsheets/d/1WLjTJX27z2lqwbzBtNjrI2SHRo8Z_fJL1LSGgUwuaM8/edit?usp=sharing)


## :memo: DEMO
## 渓谷の情報を投稿した後に、渓谷へのアクセス情報を投稿する機能を実装しました。
### :one: 渓谷情報投稿機能
![渓谷情報投稿機能](https://user-images.githubusercontent.com/71677145/99180692-da287300-276b-11eb-9d7d-0fad6ea7b9a4.png)
### :two: アクセス情報投稿機能
![アクセス情報投稿機能](https://user-images.githubusercontent.com/71677145/99180695-e3b1db00-276b-11eb-97b1-d58dc7f8d9b2.png)
### :three: 投稿後のトップページ
![投稿後のトップページ](https://user-images.githubusercontent.com/71677145/99180698-eb717f80-276b-11eb-8c95-6b7ebdf44b43.png)
## 各ページの表示情報を少なくする事で、情報を把握し易くしました。
### :one: 投稿詳細ページ
![投稿詳細ページ](https://user-images.githubusercontent.com/71677145/99180752-6175e680-276c-11eb-9638-2eb99365d358.png)
### :two: アクセス情報詳細ページ
![アクセス情報詳細ページ](https://user-images.githubusercontent.com/71677145/99180756-6470d700-276c-11eb-80d1-4397f10bd11a.png)


## :speech_balloon: 課題
### ・シンプルな表示画面を意識して、装飾します。
### ・ユーザーが「渓谷に行きたくなる」「簡単にアクセス方法を知る事ができる」ように、複数枚画像投稿機能を実装し、渓谷・アクセス情報の充実を図っていきます。
### ・ユーザーが欲しい情報を取得し易くするために、検索機能の充実を図っていきます。
### ・実装予定の機能
- CSS作成
- コメント機能
- 都道府県別詳細表示機能
- 検索機能
- 複数条件検索機能
- ランキング機能
- 複数枚画像投稿機能
- 複数枚画像表示機能
- お気に入り機能


## :wrench: 使用技術（開発環境） 
Ruby / Ruby on Rails / MySQL / Github / Visual Studio Code / Trello


## :gift: ローカルでの動作方法

```
% cd ~
% git clone https://github.com/ya-3mameo/canyon-30433.git
% cd canyon-30433
% bundle install
% yarn install
% rails db:create
% rails db:migrate
% rails s
http://localhost:3000
```


## DB設計

### usersテーブル

| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| nickname      | string  | null: false               |
| email         | string  | null: false, unique: true |
| password      | string  | null: false, unique: true |
| age           | integer |                           |
| location      | string  |                           |
| hobby         | text    |                           |
| canyon_number | integer |                           |
| birthday      | date    |                           |

#### Association
 - has_many :tweets

### tweetsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| image         |            |                                |
| concept       | text       | null: false                    |
| price         | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| visit_day     | date       | null: false                    |
| user          | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- has_one :address
- has_many :comments


### accessesテーブル

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

#### Association
- belongs_to :tweet


### commentsテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| tweet        | references | null: false, foreign_key: true |

#### Association
- belongs_to :tweet
