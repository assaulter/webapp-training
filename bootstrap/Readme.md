# TwitterBootstrapを使う
## ファイル追加
[bootstrap](http://getbootstrap.com/getting-started/#download)

DLしたやつをpublic配下に設置

## Bootstrap.cssを使う設定
```
DOCTYPE
html
  head
    title Using Slim
    meta charset="utf-8"
    meta name="viewport" content="width=device-width, initial-scale=1.0"
    link href="/css/bootstrap.min.css" rel="stylesheet"
  body
    == yield
    script src="http://code.jquery.com/jquery.js"
    script src="js/bootstrap.min.js"
```

cssとjsを使うよう設定し、jqueryも必要なので入れる。