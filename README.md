# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Version
```
ruby 2.4.1p111
Rails 5.1.3
psql (PostgreSQL) 9.6.5
```

* System dependencies

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Configuration
### gitの設定
ユーザ名とメールを設定する
```
git config --global user.name "user name"
git config --global user.email "email@com"
```

### gemをインストールする
`vendor/bundle/`にインストールされる
```
bundle install
```

### DB作成
```
bundle exec rake db:create
bundle exec rake db:migrate
```

### RAILSサーバ起動
```
bundle exec rails s -b 0.0.0.0
```