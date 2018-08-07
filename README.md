# README

# 概要
Chachee(チャッチー)という簡単なチャットシステムです
ほぼ以下のサイトを参考に作成させていただきました
[Rails 5 + ActionCableで作る！シンプルなチャットアプリ（DHH氏のデモ動画より）](https://qiita.com/jnchito/items/aec75fab42804287d71b)

## 実行環境
* ruby 2.4.4p296 (2018-03-28 revision 63013) [x64-mingw32]
* Rails 5.2.0
* DB：sqlite3

## 起動
rdebug-ide --host 0.0.0.0 --port 1234 -- ./bin/rails s -b 0.0.0.0 -p 3000 -e development

## サイトについて

### チャット機能
1. ブラウザを2つ開いて、ローカルのwebサーバーにアクセスします。
http://localhost:3000/
1. テキストボックスに文字を入力してEnter
1. 2つのブラウザに同じように反映されます

# モデル再作成
1. rails destroy scaffold message
1. rails generate scaffold message ssid:string msg:text
1. 作成した/db/migrate/xxxxxxxxxx_create_messages.rbをnull: falseにする
1. rails db:drop:_unsafe db:migrate:reset
