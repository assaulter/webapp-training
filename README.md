# Webアプリケーション開発体験
超簡単なWebアプリケーション作成を体験してもらい、Webアプリケーション作成のためのはじめの一歩になれば良いと思っている。

大体の勘所がわかればあとは調べて作るだけ！

## ざっくり概要
プログラミング言語としてはRubyを使用。

比較的軽量で、最初は余計なものがあまりついていないSinatra（Web Framework）を用いてTodoアプリケーションを作成する。
 
あくまで体験なので、Rubyその他については詳しくやりません。

(ぶっちゃけSinatraとActiveRecordほとんど使ったこと無いので、一緒に勉強しましょう！)

## 実行環境
MacOSローカルでの開発を想定（bundlerが動作すればどこでも大丈夫）

## 事前学習
[HTML入門](http://dotinstall.com/lessons/basic_html_v3)

[Ruby入門](http://dotinstall.com/lessons/basic_ruby_v2)

[SQLite入門](http://dotinstall.com/lessons/basic_sqlite)

HTMLの基本的な部品とRubyが読めて、データベースの概念がわかっていればOK

## 事前準備
```
$ rbenv -v
$ gem -v
$ bundler -v
```
rubyは2.1系であればなんでもいいと思います。
$ rbenv local ~で、作業するディレクトリのバージョンを固定しましょう。

## 進め方
せっかくなので、

* gitlabのnewbies配下に各人、リポジトリを作成してもらって
* お題毎にブランチを切る
* お題が完了したらマージリクエストを作る（僕が見ます。masterに対するマージリクエストでいいです）
* マージリクエストはあくまでレビュー用なのと、待ち時間がもったいないので、自分で（gitlabではなく）masterにマージをし、次のお題ブランチを生やす
* 以降繰り返し

## カリキュラム目次
1. [Hello, World!](https://133.208.22.231/newbies/create-web-app/tree/level1/helloworld)
2. [画面にプログラムから情報を渡す](https://133.208.22.231/newbies/create-web-app/tree/level1/useslim)
3. [Todoアプリケーションの作成](https://133.208.22.231/newbies/create-web-app/tree/level2/activerecord)
4. [TwitterBootstrapおよびバリデーションの導入](https://133.208.22.231/newbies/create-web-app/tree/level2/refactor_activerecord)
5. [Todoアプリケーションの改修](https://www.biglobe.net/pages/viewpage.action?pageId=20035660)

番外編：デモ振り返りプランニングに参加してもらう？


## 参考文献
### Sinartraとか
[Sinatra README](http://www.sinatrarb.com/documentation.html)

[Sinatra README(Japanese)](http://www.sinatrarb.com/intro-ja.html)

[ActiveRecord::Base](http://api.rubyonrails.org/classes/ActiveRecord/Base.html)

[Railsチュートリアル](http://railstutorial.jp/)
Sinatraである程度やった後に見ることをオススメします。便利なんだけどやること多くてめんどくさいのがわかると思います。

### 他社のプログラミング研修(勉強になります)

[mixi-inc. RubyTraining](https://github.com/mixi-inc/RubyTraining) 
もうちょっと深い所をやっています。

[mixi-inc. JavaScriptTraining](https://github.com/mixi-inc/JavaScriptTraining)
Web屋さん、特に画面をやる場合にはJavaScriptは必須なので、是非。Promise辺りから難易度上がるので、一旦DOMの操作までで切り上げていいと思います。

[Hatena-Textbook / javascript-event-driven.md](https://github.com/hatena/Hatena-Textbook/blob/master/javascript-event-driven.md)
もうちょっとJS寄りの解説

### おもしろ
[人は一ヶ月でエンジニアになれるのか？](http://www.slideshare.net/kiyotoyamaura/1-45361529)

[↑の詳細解説編](http://www.slideshare.net/livesense/ss-46078743)
