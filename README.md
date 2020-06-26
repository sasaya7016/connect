# Connect (SNSアプリ)
<img width="1293" alt="connect1" src="https://user-images.githubusercontent.com/61730661/85207072-5061ae80-b361-11ea-9873-ccac65e87d46.png">

## 概要
> ### このアプリでできること
* ユーザーの登録、ログイン、ログアウト
* ツイート投稿、詳細、編集、削除、検索
* コメント投稿、削除
* いいね機能の付与、削除
* ランキング機能、ツイートいいねに対してツイートランキング
* チャット機能、グループ作成、メッセージ投稿
* マイページ機能、詳細(マイツイートの確認)
* マイページ機能、プロフィール編集(アイコン、プロフィール作成)

> ### 今後搭載予定
* フォロー機能(フォローした方のツイート表示、チャットメンバー表示)
* ユーザー検索



## 使用した技術
* 言語:  Haml/SCSS/Javascript,Ruby/SQL
* FW:  Ruby on Rails
* DB:  MySQL
* AWS:  EC2
* ミドルウェア:  Unicorn,Nginx
  

## 制作背景
> いろいろな機能を搭載したSNSサイトを作成したいと思い、作成しております。

## チャット機能
<img width="966" alt="connect2" src="https://user-images.githubusercontent.com/61730661/85207086-68d1c900-b361-11ea-8fa3-ee6b5e89d4dc.png">

## マイページ
<img width="1258" alt="connect3" src="https://user-images.githubusercontent.com/61730661/85207087-6a02f600-b361-11ea-836a-42875ff047c6.png">


## データベース設計 
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|
|icon_image|string|
|profile|text|

### Association
- has_many :tweets
- has_many :comments
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages
- has_many :likes, dependent: :destroy

### tweetテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|
|image|text|
|user_id|integer|
|likes_count|integer|

### Association
- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|
|image|string|
|group_id|bigint|
|user_id|bigint|

### Association
- belongs_to :group
- belongs_to :user

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|
|user_id|integer|
### Association
- belongs_to :tweet, counter_cache: :likes_count
- belongs_to :user

## groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false

### Association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :messages

## group_userテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|bigint|
|user_id|bigint|
### Association
- belongs_to :group
- belongs_to :user

## commentデーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|tweet_id|integer|
|text|text|
### Association
- belongs_to :tweet
- belongs_to :user


## relationship デーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|
|followed_id|integer|
### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"