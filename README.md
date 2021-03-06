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
家事の手助けを目的としたアプリケーションを考えているので今回は、「性別は女性」に設定します。家事に慣れてない人をターゲットとしているため、「年齢は20代半ば」とします。  
職業についてどのような会社かは設定しないようにします。仕事と家事の両立を目指し、休日(空いた時間)を有効活用したいと考えています。  
趣味はsnsを投稿することです。


### 実装目的
女性の社会進出が進む中、仕事と家事の両立をしている女性や専業主婦の方は日頃より時間に追われているように感じました。そこで家事を少しでも楽にするように煩雑な作業をプログラムで効率化を図り自分時間(趣味の時間)を確保してもらうためです。


# DEMO
### トップページ
![主婦](https://user-images.githubusercontent.com/79575206/129692745-e1887c80-e791-4f8d-abaf-37488de414d0.png)
#### 概要
いろいろな機能に飛べるようにホームのページを実装させていただきました。    
トップページから各機能へアクセスできるような作りになっており、シンプルなデザインにさせていただきました。また、ヘッダーのホームボタンでこのトップページにリダイレクトされるようにしております。
#### 課題
他機能追加

### 掲示板一覧表示
![掲示板トップページ](https://user-images.githubusercontent.com/79575206/123580860-9c1d2280-d815-11eb-969c-3bb0d1d8167e.jpeg)
#### 概要
日頃の悩みや疑問などを気軽に相談できるようにするために掲示板機能を実装させていただきました。  
こちらもシンプルなデザインにさせていただきました。NewPostボタンから新規登録ができるようになっております。  
現時点では、掲示板投稿機能で選択するジャンルから検索を行うことができます。

#### 課題
より複雑な検索ができるようにすること。

### 掲示板投稿ページ
![掲示板投稿](https://user-images.githubusercontent.com/79575206/123581164-4e54ea00-d816-11eb-9104-5b04023089fd.jpeg)
#### 概要
こちらのページから掲示板を投稿できるように実装させていただきました。  
ジャンルの項目ではプルダウンリストの形式で実装しており、掲示板一覧表示より検索を行うことができます。タグの項目ではformオブジェクトパターンを用いて実装しております。また、Ajaxを用いて逐次検索機能を実装している段階です。  
新規投稿が成功するとページ上部にメッセージが表示されるようにしました。
#### 課題
逐次検索機能の完全実装  


### 掲示板詳細ページ
![掲示板詳細ページ](https://user-images.githubusercontent.com/79575206/123583532-b4dc0700-d81a-11eb-9cc5-77ef08b23561.jpeg)
#### 概要
投稿者の悩みを解消するためにコメント機能を実装させていただきました。  
右のボタンから新規投稿、編集、削除を行えます。
新規投稿、編集、削除が成功するとページ上部にメッセージが表示されるようにしました。
#### 課題
コメント機能を非同期通信で実装すること。  



### 料理一覧表示
![料理一覧表示](https://user-images.githubusercontent.com/79575206/123581394-ca4f3200-d816-11eb-9f9e-7ab243f554cb.jpeg)
#### 概要
料理投稿機能につきましては、毎日の献立アイデアの手助けや自分が作った料理を共有するために実装させていただきました。  
料理投稿ボタンから料理投稿ページへ遷移できます。また、料理名、作り方から料理詳細ページへ遷移できます。  
いいね機能実装。
#### 課題
検索機能の実装。


### 料理投稿ページ
![料理投稿](https://user-images.githubusercontent.com/79575206/123581634-46e21080-d817-11eb-85e9-49d8d802d4d8.jpeg)
#### 概要
作った料理の写真を共有するために画像のアップロードができるように実装させていただきました。  
新規投稿が成功するとページ上部にメッセージが表示されるようにしました。
#### 課題
材料の項目を保存できるように実装すること。




### 料理詳細ページ
![料理詳細](https://user-images.githubusercontent.com/79575206/123581742-7bee6300-d817-11eb-94e6-afb0887a9dc3.jpeg)
#### 概要
お気に入り登録機能をajax機能を用いて実装させていただきました。
右のお気に入りボタンからお気に入り登録を行った料理の一覧を表示します。   
右のボタンから新規投稿、編集(現状未実装)、削除を行えます。
新規投稿、編集、削除が成功するとページ上部にメッセージが表示されるようにしました。  
いいね機能実装(いいねの数を集計し表示)。
#### 課題
いいね機能のAjax化。



### 料理詳細ページ(レビュー機能)
![料理詳細](https://user-images.githubusercontent.com/79575206/129694257-d2ab256e-7f48-4317-8e57-c21e4e6b57b7.png)
#### 概要
料理詳細ページの下部にレビュー機能を実装させていただきました。
レビューは星のロゴにカーソルをあてると色がつくようにJavaScriptを用いて実装しており、クリックされた星の数を数え、星の数/5という形で表示しております(こちらもJavaScriptで実装)。コメントも保存できます。    
保存ボタンでレビューを保存でき、他のレビューを見るリンクからレビューの一覧画面に遷移します。

#### 課題
現状なし。


### レビュー機能詳細一覧ページ
![料理詳細](https://user-images.githubusercontent.com/79575206/129696741-08d89c7f-73fa-4976-aaaf-be681689b646.png)
#### 概要
料理詳細ページ(レビュー機能)の他のレビューを見るリンクから表示することができます。このページではレビューをしたユーザーがつけた星の数の平均を星の色で表現しております。また、ユーザーそれぞれのレビュー内容と全体のレビューの件数も表示しております。
#### 課題
現状なし。















### カレンダー表示
![カレンダー](https://user-images.githubusercontent.com/79575206/123581886-c7087600-d817-11eb-9c78-5d88d4ad8a6c.jpeg)
#### 概要
アプリ使用者の今後の予定の管理を行うために実装させていただきました。  
予定登録ボタンからカレンダー登録ページへ遷移できます。さらには、予定登録を完了すると予定一覧に今後の予定が表示され、カレンダー自体にも項目が表示できるような作りになっております。
#### 課題
カレンダー機能を非同期通信で実装すること。



### カレンダー登録ページ
![カレンダー登録](https://user-images.githubusercontent.com/79575206/123582049-0fc02f00-d818-11eb-8cdd-e97240c95972.jpeg)
#### 概要
予定登録が成功するとページ上部にメッセージが表示されるようにしました。
#### 課題
現状なし。


### 家計簿表示  
![家計簿トップページ](https://user-images.githubusercontent.com/79575206/127953289-bc62c73d-1484-464b-9070-4f063f484693.png)
![家計簿トップページ](https://user-images.githubusercontent.com/79575206/127953313-4fdd4c58-743f-43ef-86e5-71c2690a21bb.png)
#### 概要
アプリ使用者の収入・支出の管理を行うために実装させていただきました。  
家計簿登録ボタンから家計簿登録ページへ遷移できます。また、家計簿登録を完了すると収入記録・支出記録に収入・支出がそれぞれ表示され、カレンダー自体にも金額が表示できるような作りになっております。  
さらには、画像中央には収入・支出・合計があり、収入項目・支出項目には、それぞれの今までの記録の合計金額を表示。合計項目には収入・支出の差額を表示。  
合計項目の表示については  
収入金額が支出金額より多い場合→青色で表示  
収入金額が支出金額より少ない場合→赤色で表示  
このように金額によって文字の色を変更できるようにJavaScriptを用いて実装しております。  
画像下部には収入記録・支出記録があり、個々の登録項目から編集ページに飛ぶ事ができるようなつくりになっております。
#### 課題
現状支出金額のみカレンダーに表示されるので、収入金額も表示できるようにする。  
カレンダーに表示されている項目から詳細ページに飛べるように修正する。


### 家計簿登録ページ
![収入金額・支出金額登録](https://user-images.githubusercontent.com/79575206/127955373-de23acc3-4eb8-4bf9-9400-d75446be04c1.png)
#### 概要
こちらのページから収入金額・支出金額を登録できるように実装させていただきました。  
カテゴリーの項目ではプルダウンリストの形式で実装しております。また、下部のリンクから収入金額・支出金額の登録を切り替える事ができます。
#### 課題
見た目の修正。


### 家計簿編集ページ
![収入金額・支出金額登録](https://user-images.githubusercontent.com/79575206/128122812-77c5d07e-3c53-4630-b8d8-6cf8a45123af.png)
#### 概要
家計簿トップページの収入記録・支出記録の項目をクリックするとこちらのページに遷移します。  
こちらのページから収支を編集できるように実装させていただきました。  
収支登録が成功するとページ上部にメッセージが表示されるようにしました。
#### 課題
特になし。


### 家計簿削除機能
![収入金額・支出金額登録](https://user-images.githubusercontent.com/79575206/128122903-7ff8fc2c-3f4d-4814-9060-b06551cdaa15.png)
#### 概要
下の削除リンクを押すと確認ダイアログを表示した上で削除できるように実装させていただきました。
#### 課題
特になし。








# 工夫したポイント
・新規投稿、編集、削除などのアクションが成功するとメッセージが表示される。  
・お気に入り登録をajax機能で実装。  
・タグ機能をformオブジェクトパターンで実装。  
・ページネーション機能の実装。  
・検索機能の実装。  
・各種機能ユーザーログインの有無で表示を変える実装をしております。

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
・テストコードの実施
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
- has_many :blogs



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




## blogs テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |  
| content       | string     |                                |  
| start_time    | datetime   | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user








