# rackup
config.ruから起動できるようになった。
詳細は公式ドキュメントを読む。

http://www.sinatrarb.com/intro-ja.html

これのモジュラーアプリケーションの提供のところ

## ゴール
![結果](http://i.imgur.com/6tpzzmg.png)

## 毎回再起動めんどくさいのでreloaderを導入
modular appなので
```
class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
...
end
```

起動時にdevelopmentを指定する
```
$ bundle exec rackup -E development
```

## ついでにbootstrapを入れてみる
[bootstrap](http://getbootstrap.com/getting-started/#download)

DLしたやつをpublic配下に設置



## 追加課題
起動するポート番号を変更する
