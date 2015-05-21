# Knockout.jsを使って、なるべく画面をリロードしないように作ってみる
## お断り
あくまでSPAっぽくやる一例なので、自分ですきなようにやってほしい。

## ゴール
![結果](http://i.imgur.com/dd4YfFN.png)

## 機能
* タスクを追加出来る
* タスクを完了状態にできる

## 前準備

* level2/activerecordブランチに改修を加える
* knockout.jsとjQueryを取得し、app/public/scripts配下に追加

## 新規にアプリケーションを作る
* app/api.rbを追加
* config.ruで/api配下にアクセスが有った場合は、apiアプリケーションを使うようにする

## knockout.jsでhello, world
* layout.slimでknockout.jsとjQueryを読み込むようにする
* api.rbでshowアクションを追加し、show.slimを追加
* show.slimで適当に

```
p data-bind="text: name"
javascript:
	ko.applyBindings({name: 'hello, world'});
```
こんな感じで出るはず。JS実行タイミングに気をつける。

## あとはJSとapiを頑張る
基本前回のactiverecordでやってたのをjsonでやるように変換し、knockout.js側で別途モデルを持つようにすれば出来るはず。