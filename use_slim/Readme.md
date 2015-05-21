# Viewにアプリケーションから情報を渡す
今回はせっかくなので、erbではなくslimを使ってもらいます。

[slim](http://slim-lang.com/)

* Gemfileにslimを追加
* app.rbでrequire
* viewsディレクトリ内にindex.slimを追加

## ゴール
![結果](http://i.imgur.com/REdHR5M.png?1)

# 解答
アプリケーションで、id, nameを持つハッシュの配列を定義

@付きの変数はviewからも参照できるので、viewでコレクション.eachを使用して一つづつ表示する

## 解説
Sinatraの機能で、viewsディレクトリ内にあるテンプレートは

```
slim :index
```
のように使用できる。