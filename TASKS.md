# TODOアプリケーションの改修

ここまでである程度出来るようになったはずなので、お題を出して自主的にやらせる。

## お題一覧
* SQLite→MySQL, PostgreSQL等に変更してみる
	* データ移植方法等も調べてもらう
* タスクに期限を設定できる
* 任意で設定した期限付近のタスクがあることが画面でわかる
* ToDoのジャンル分けができる（仕事、個人とか...）
* Todoにタグが追加できる
* 完了したタスクを削除出来る(現状はステータスの変更なので...)
* ログイン機構を追加し、複数ユーザ毎に状態が復元できること

## 更に難易度の高いお題一覧
* JavaScriptを使い、なるべくロードがないアプリケーションにする
	* [knockout.jsで作ったサンプル](todo_with_knockoutjs)
* 期限間近のタスクを通知出来る
	* chrome notification 等
* Todoを人にアサインできる