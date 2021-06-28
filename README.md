# README

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
家事の手助けを目的としたアプリケーションを考えているので今回は,「性別は女性」に設定します。家事に慣れてなく人をターゲットとしているため,「年齢は20代半ば」とします。  
職業についてどのような会社かは設定しないようにします。仕事と家事の両立を目指し、休日(空いた時間)を有効活用したいと考えています。  
趣味はsnsを投稿することです。


### 実装目的
女性の社会進出が進む中、仕事と家事の両立をしている女性や専業主婦の方は日頃より時間に追われているように感じました。そこで家事を少しでも楽にするように煩雑な作業をプログラムで効率化を図り自分時間(趣味の時間)を確保してもらうためです。


# DEMO
### トップページ
![主婦](https://user-images.githubusercontent.com/79575206/123580245-5e6bca00-d814-11eb-8731-c765d7c3e3ef.jpeg)
#### 概要
トップページから各機能へアクセスできるような作りになっており、シンプルなデザインにさせていただきました。  
また、ヘッダーのホームボタンでこのトップページにリダイレクトされるようにしております。

### 掲示板一覧表示
![掲示板トップページ](https://user-images.githubusercontent.com/79575206/123580860-9c1d2280-d815-11eb-969c-3bb0d1d8167e.jpeg)
#### 概要



### 掲示板投稿ページ
![掲示板投稿](https://user-images.githubusercontent.com/79575206/123581164-4e54ea00-d816-11eb-9104-5b04023089fd.jpeg)
#### 概要



### 掲示板詳細ページ
![掲示板詳細ページ](https://user-images.githubusercontent.com/79575206/123583532-b4dc0700-d81a-11eb-9cc5-77ef08b23561.jpeg)
#### 概要



### 料理一覧表示
![料理一覧表示](https://user-images.githubusercontent.com/79575206/123581394-ca4f3200-d816-11eb-9f9e-7ab243f554cb.jpeg)
#### 概要



### 料理投稿ページ
![料理投稿](https://user-images.githubusercontent.com/79575206/123581634-46e21080-d817-11eb-85e9-49d8d802d4d8.jpeg)
#### 概要



### 料理詳細ページ
![料理詳細](https://user-images.githubusercontent.com/79575206/123581742-7bee6300-d817-11eb-94e6-afb0887a9dc3.jpeg)
#### 概要



### カレンダー表示
![カレンダー](https://user-images.githubusercontent.com/79575206/123581886-c7087600-d817-11eb-9c78-5d88d4ad8a6c.jpeg)
#### 概要




### カレンダー登録ページ
![カレンダー登録](https://user-images.githubusercontent.com/79575206/123582049-0fc02f00-d818-11eb-8cdd-e97240c95972.jpeg)
#### 概要








# 工夫したポイント


# 使用技術(開発環境)
### フロントエンド
HTML,CSS,JavaScript,JQuery,Ajax
### バックエンド
Ruby,Ruby on Rails
### データベース
MySQL,SequelPro
### ソース管理
GitHub,GitHubDesktop
### テスト
RSpec
### エディタ
VSCode


# 課題や今後実装したい機能
・ajax機能が搭載できそうなところがいくつかあるのでそのところを修正。  
・このアプリのカレンダー機能をグーグルカレンダーと同期。    
・Viewの見た目をもっとモダンに。  
・APIなどをうまく活用して開発を行っていきたい。

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








