#  Find Suomi

### ■ サービスURL
https://find-suomi.fly.dev/

### ■ サービス概要
日本にいながらもフィンランドの雰囲気を感じたいという人を対象にした、  
フィンランドが体験できるお店・施設の検索サービスです。

### ■ ターゲットユーザー
年齢・性別等属性を問わず、フィンランドに興味がある人、  
フィンランドの雰囲気を日本にいながら感じたい人を対象としています。

### ■ サービスの利用イメージ
施設をジャンルや地域別で絞り込んで検索することができる。  
➜ 自分の興味に合わせて検索できる、自分の都合の良い場所にある施設を検索することができる。

<details>
<summary>サービス開発の背景</summary>
フィンランドの雰囲気が感じられる施設をネットで検索すると、「北欧」でまとめられていたり  
まとめ記事やブログがメインで、行きたいジャンルの施設や自分が行ける範囲にある所の情報を得るまでに時間がかかります。  
そこで、フィンランドに関連した施設に特化していて、かつジャンルと場所で検索しやすいものがあれば欲しいと思い、  
このサービスを考えました。  
なかなか現地に行けないけれどフィンランドを体験したいという人に向けて、  
一箇所で情報がまとまっていて探しやすい、訪問予定が立てやすくなるサービスにしていきたいと考えています。
</details>

### ■ サービスの差別化ポイント・推しポイント
- 日本国内にある施設についてはまとめ記事がメインで検索サービスがない。
- 「北欧」のくくりではなくフィンランドに特化している。

### ■ 機能
#### 実装済みの機能
- 施設検索
  - ジャンル別検索
  - 地域別検索
  - キーワード検索
- 施設情報表示画面
  - 施設一覧（検索結果一覧）
  - 施設情報詳細
    - GoogleMap表示
- ユーザー登録、ログイン/ログアウト機能
  - パスワード再設定機能
- プロフィール表示/編集機能
  - アバター設定/編集機能
- 口コミ投稿/編集機能（登録ユーザーのみ投稿/閲覧可能）
  - 画像投稿/編集機能
  - 他のユーザーの口コミに対するいいね機能
- 施設のブックマーク登録/解除機能（登録ユーザーのみ可能）
- 管理者画面

#### ■ これから実装予定の機能
- 施設検索
  - キーワード検索でのオートコンプリート機能
- ユーザー管理
  - メールアドレス変更時の確認メール送信機能
  - 退会機能
- 「LINEで送る」機能（施設詳細画面内）
- 通知機能
  - 新しい施設が登録された時
  - 投稿した口コミにいいねされた時

### ■ 主な使用技術
##### バックエンド
- Ruby 3.2.1
- Ruby on Rails 7.0.8

##### フロントエンド
- Tailwinsd CSS
- daisyUI
- Hotwire (Turbo, Stimulus)

##### インフラ
- Fly.io
- Amazon S3 (画像アップロード)

#### 使用API
- Maps JavaScript API

### ■ 画面遷移図
https://www.figma.com/file/mpgeLXkfll6hqy0W7vDsyJ/Screen-Transition-Diagram?type=design&node-id=0%3A1&mode=design&t=eQTH4c5TuOo84N1a-1

### ■ ER図
![er_diagram drawio](https://github.com/noriko-tahara/find_suomi/assets/116807250/ba6eafe8-b8c3-4e96-acc1-38aa9567c269)

https://gyazo.com/9bd140b7aa56b89146af9ec04488ec59
