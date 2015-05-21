# ActiveRecordを使う

## ゴール
![結果](http://i.imgur.com/S4VOcDm.png)

## 機能
* タスクを追加出来る
* タスクを完了状態にできる

## 課題1
db:migrateとdb:seedを使えるようにする
→別プロジェクトで実施済み

### 回答
* Gemfileを更新

```
gem 'rake'
gem 'sinatra'
gem 'sinatra-base'
gem 'sinatra-contrib' # for sinatra/reloader
gem 'sinatra-activerecord'
gem 'slim'
gem 'sqlite3'
```

* Rakefileを追加

```
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
```

コレでコマンドが使えるようになる

## 前準備

* gemを追加
* Rakefile追加
  * $ bundle exec rake -vTでmigration関係のコマンドが追加されていることが確認できる
* migration用ファイル作成
	* $ bundle exec rake db:create_migration NAME=create_todos
	* db/migrate配下にファイルが出来る
* できたファイルを編集
	* 今回はタイトルと完了かどうかのみ
* app.rbに設定追加
  * dbとのコネクション
* Rakefileに設定追加
  * ./appをrequireしてるだけ

## テーブルを作成してみる
```
$ bundle exec rake db:migrate
```

## 確認
```
$ sqlite3 todos.sqlite3
sqlite> .tables
schema_migrations  todos
sqlite> .schema todos
CREATE TABLE "todos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" text, "done" boolean);
sqlite> .q
```

## 初期データを用意する
db/seeds.rbを用意
```
$ bundle exec rake db:seed
$ sqlite3 todos.sqlite3
sqlite> select * from todos;
1|牛乳を買う|f
2|髪を切る|t
sqlite> .q
```

## 課題2
seed.rbで投入したデータが画面に表示できること

## 解答例
Todo.allで全件取得

viewへcontrollerのインスタンス変数を渡すことができるのでそれを表示

## 課題3 
formを使って、タスクの追加が出来る

## 解答例
formからタスクを投げ、受け取るアクションを一つ追加。

アクション内では、完了したら一覧にリダイレクトする。
