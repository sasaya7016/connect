# Connect (SNSアプリ)

## 概要
> ### このアプリでできること
>> ユーザーの登録、ログイン、ログアウト
>> ツイート投稿、詳細、編集、削除、検索
>> コメント投稿、削除
>> いいね機能の付与、削除
>> ランキング機能、ツイートいいねに対してツイートランキング
>> チャット機能、グループ作成、メッセージ投稿
>> マイページ機能、詳細(マイツイートの確認)
>> マイページ機能、プロフィール編集(アイコン、プロフィール作成)

> ### 今後搭載予定
>> フォロー機能(フォローした方のツイート表示、チャットメンバー表示)
>> ユーザー検索



## 使用した技術
* 言語:  Haml/SCSS/Javascript,Ruby/SQL
* FW:  Ruby on Rails
* DB:  MySQL
* AWS:  EC2
* ミドルウェア:  Unicorn,Nginx
  

## 制作背景
> いろいろな機能を搭載したSNSサイトを作成したいと思い、作成しております。





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


