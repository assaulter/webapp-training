# validationおよびTwitterBootstrapの導入

# テスト周りを整理する
なんだかんだテスト書けないと不便なことに金曜夕方に気づいたので、テスト出来るようにしていくよ。
テスト対象： Modelのvalidation

## validationとは？
氏名は全角〜とかのアレ

後日やるセキュリティ研修でも出てくると思いますが、ユーザがシステムに対して影響を与える操作なので、ちゃんと精査しましょうという機能。

サービスとしても、存在しない商品を買いたいです！って言われても困るので、弾く。

## 準備
### Gemfileに色々追加

```
# テスト関係
gem 'rspec'
gem 'factory_girl'
gem 'rack-test'
```

### DBの設定をyaml化
config.ymlとapp.rbの設定部分を参照

### spec_helper.rbを作成
ファイル参照のこと

### factory_girl用テスト定義を作成
todo.rbを参照のこと

## テストを追加する
正常なデータと、バリデーションエラーになる場合を作る

app_spec.rbを参照

## テストが通るようにバリデーションを追加する

```
$ bundle exec rspec app/spec/spec_helper.rb
```

やってみそ

## 参考
[バリデーション](http://www.techscore.com/tech/Ruby/Rails/model/validation/1/)
[Railsのモデルのバリデーションエラー errors や full_messages の使い方](http://ruby-rails.hatenadiary.com/entry/20140810/1407623400#erorrs-usage)

# 画面から空のTodoが追加出来ないようにする
さっき実装したvalidationを使うよ

# TwitterBootstrapを導入してみる
TwitterBootstrapとは？

デザイン出来ないエンジニア御用達ツール（ウソ

UIの部品および、決められたレイアウトが提供されているので、テンプレートに嵌ったデザインならすぐ作れてそれなりの見た目になる！

TwitterBootstrapがおそらくいちばん有名で、cssフレームワークで検索すると沢山出てくる。

[ここ](http://getbootstrap.com/getting-started/)からDLしたファイルをpublic配下に展開
viewsと同じ階層に用意すること

## layout.slimを編集
layout.slimを参照

## 画面を適当に編集
form-inlineと、list-groupを使ってみた

# エラーの中身を画面に表示する

## Sinatraのsessionを使う
ヒント:session.clearしないと...？

## validationエラーの際に、オブジェクトに格納される情報は？

```
.#<ActiveModel::Errors:0x007ffad9f65078
 @base=#<Todo:0x007ffad9f65910 id: nil, title: "", done: false>,
 @messages={:title=>["can't be blank"]}>
```

プロパティ名をキーとしたハッシュに、Arrayで格納されている
→複数バリデーションを設定すると、その分格納されるため。

# Tableにカラムを追加する

## 参考文献
http://api.rubyonrails.org/classes/ActiveRecord/Migration.html

## マイグレーションファイルを追加
//ホントはversion書けるので、同じ名前で違うバージョンの筈（未検討）
$ bundle exec rake db:create_migration NAME="適当なやつ"

## 出来たファイルを編集する
```
def change
  add_column :todos, :tag, :text
end
```
add_column :テーブル名, :カラム名, 属性
を指定する

## migration実行
$ bundle exec rake db:migrate