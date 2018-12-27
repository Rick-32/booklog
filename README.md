## usersテーブル

|Column|Type|Options|
|------|----|-------|
|username|string|null: false, unique: true|
|password|string|null: false|
|email|string|null: false, unique: true|
|gender|integer|null: false|
|birthdate|integer|null: false|
|bookshelf_name|string|null: false, unique: true|
|prefecture|integer|null: false|
|hometown|string||
|occupation|string||
|profile|text||
