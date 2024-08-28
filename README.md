# more kind.
## サイト概要
### サイトテーマ
車椅子やベビーカーを使用している人が行きやすい施設を口コミできるレビューサイト
​
### テーマを選んだ理由
前職は知的障碍者の方の入所施設に勤めており、車椅子の方と１対１で出かける機会が多かったです。
その際スロープの幅が狭く車椅子が切り替えしにくかったり、多目的トイレが１階にしかなかったりと、施設HPに「車椅子可」という記載があっても実際に行ってみないとわからない不便さがありました。
そこで実際に行ってみた人が不便に感じた施設、快適に感じてまた行きたいと思った施設をレビューしあい、外出の計画段階から安心感を持てるようなサイトがあればと思い、このようなポートフォリオを作成しようと思いました。

### ターゲットユーザ
- 車椅子を使用している人、その家族
- 福祉施設に勤めている人
- ベビーカーを使用している人、使用する予定の人
​
### 主な利用シーン
ターゲットユーザが気軽に出かけたいと考えた時
遠出した時に不安なく行ける場所を探したいと考えた時
行きたい施設があった時、予め注意した方がいいことがあるか調べたい時

## 設計書
  - テーブル定義書:https://docs.google.com/spreadsheets/d/1jNTx57H4QDdxY7thm5SRYMOR8z2j0ErmdTh4YBzp-lw/edit?usp=drive_link
  - ER図:
​ 　　 ![ER図(admin)](https://github.com/user-attachments/assets/fceb4d89-bab3-42c6-8ac3-9e4372dd2492)
     ![ER図(member)](https://github.com/user-attachments/assets/aa6a00a3-84f7-42bd-82d6-c45066ae11a1)

## 機能一覧
- ユーザー登録、ログイン機能 (devise)
- 投稿機能
- コメント機能
- タグ機能 (acts-as-taggable-on)
- ページネーション機能 (kaminari)
- 検索機能
- ソート機能
- 住所自動入力機能 (jpostal)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
​
## 使用素材
本アプリケーションでは著作権に配慮し、主に架空のデータを使用しています。
フリー画像については以下のサイトから提供を受けており、クレジット表記は不要です：
- 画像の提供元: [photoAC](https://www.photo-ac.com/) と [vectorshelf](https://vectorshelf.com/)
- なお、実在するデータを使用する際には、事前に著作権保持者と契約を結んだ上で利用します。


