# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# アプリ名
## 主婦の味方

# 概要
家事の手助け、家事の悩み解消を目的とした多機能搭載アプリ

# 本番環境
URL : https://housewife-app.herokuapp.com/  
ID：hamasato  
PASS：0621  
  
ログイン情報(テスト用)  
Email : y@y.com  
Password : yyyyyyy7  

# 制作背景(意図)
### 企画(ペルソナ)
家事の手助けを目的としたアプリケーションを考えているので今回は、「性別は女性」に設定します。家事に慣れてなく人をターゲットとしているため,
「年齢は20代半ば」とします。  
職業についてどのような会社かは設定しないようにします。仕事と家事の両立を目指し、休日(空いた時間)を有効活用したいと考えています。  
趣味はsnsを投稿することです。


### 実装目的
女性の社会進出が進む中、仕事と家事の両立をしている女性や専業主婦の方は日頃より時間に追われているように感じました。そこで家事を少しでも楽にするように煩雑な作業をプログラムで効率化を図り自分時間(趣味の時間)を確保してもらうためです。



# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth           | date   | null: false |

### Association

- has_many :posts
- has_many :comments
- has_many :cooks


## posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |  
| text          | text       | null: false                    |  
| genre_id      | integer    | null: false                    |  
| user          | references | null: false, foreign_key: true |


### Association

- has_many :post_tag_relations
- has_many :tags, through: :post_tag_relations
- belongs_to :user
- has_one_attached :image


## tags テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     |  uniqueness: true              |  


### Association

- has_many :post_tag_relations
- has_many :posts, through: :post_tag_relations


## post_tag_relation テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | references | null: false, foreign_key: true |
| tag           | references | null: false, foreign_kei: true |    


### Association

- belongs_to :post
- belongs_to :tag


## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |  
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_kei: true |  


### Association

- belongs_to :user
- belongs_to :post





## cooks テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |  
| description   | text       |                                |  
| portion       | float      |                                |  
| point         | text       |                                |  
| reference     | text       |                                |  
| time          | integer    |                                |  
| appearance    | integer    |                                |  
| memo          | text       |                                |  
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :ingredient


## ingredients テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     |                                |  
| quantity      | string     |                                |  
| cook          | references | null: false, foreign_key: true |


### Association

- belongs_to :cook








