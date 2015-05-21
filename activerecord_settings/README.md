# 与えた課題
db:create_migration

db:create

db:seedの

の３つのコマンドを使って、テーブル作成と初期データ投入ができること

# 手順

Gemfileを書く
$ bundle install

Rakefileを書く
Rakefileに以下を追加

```
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
```

作りたいテーブルに対応するモデルクラスを作る
models/todo.rb

```
class Todo < Activerecord::Base
end
```

マイグレーション用ファイルを生成する(コマンドで自動生成)
$ bundle exec rake db:create_migration NAME="create_todos"

生成されたファイルに、テーブルを作る命令を書く
```
def change
  create_table :todos do |t|
    t.string :title
    t.boolean :done
  end
end
```

アプリケーションの起点となるファイルを追加する
app.rb

```
# モデルクラスを読み込む
require_relative 'models/todo'

# db connection setting
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'todos.sqlite3'
)
```

RakeFileからapp.rbを読み込む

```
require_relative 'app'
```

コマンド実行
$ bundle exec rake db:migrate

seedファイルを追加

```
# -*- coding: utf-8 -*-
Todo.create(title: '牛乳を買う', done: false)
Todo.create(title: '髪を切る', done: true)
```

コマンド実行
$ bundle exec rake db:seed

```
[migrate_sample] sqlite3 todos.sqlite3
SQLite version 3.7.13 2012-07-17 17:46:21
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> select * from todos;
1|牛乳を買う|f
2|髪を切る|t
sqlite> .q
```